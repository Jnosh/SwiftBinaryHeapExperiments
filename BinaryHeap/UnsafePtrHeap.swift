//
//  UnsafePtrHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Storage class used to provide CoW
private final class UnsafePtrHeapStorage<Element : Comparable> : NonObjectiveCBase {
    private var buffer: UnsafeMutablePointer<Element>
    private var capacity: Int
    private var count: Int

    private override init() {
        buffer = nil
        count = 0
        capacity = 0
    }
    
    deinit {
        buffer.destroy(count)
        buffer.dealloc(capacity)
    }
}

/// Binary heap backed by an UnsafeMutablePointer to a buffer
public struct UnsafePtrHeap<Element : Comparable> {
    private var storage: UnsafePtrHeapStorage<Element>

    public init() {
        storage = UnsafePtrHeapStorage()
    }

    private mutating func reserveCapacity(minimumCapacity: Int) {
        if storage.capacity < minimumCapacity {
            // Allocate a new buffer
            let newCapacity = nextPoW2(minimumCapacity)
            let newBuffer = UnsafeMutablePointer<Element>.alloc(newCapacity)

            // Copy the contents to the new buffer
            // Destroy the old buffer in the process if we hold the only reference
            if isUniquelyReferenced(&storage) {
                newBuffer.moveInitializeFrom(storage.buffer, count: count)
                storage.buffer.dealloc(storage.capacity)
            } else {
                newBuffer.initializeFrom(storage.buffer, count: count)
                storage = UnsafePtrHeapStorage()
            }

            storage.buffer = newBuffer
            storage.capacity = newCapacity
        }
    }

    private mutating func ensureUniquelyReferenced() {
        if !isUniquelyReferenced(&storage) {
            let newStorage = UnsafePtrHeapStorage<Element>()
            
            newStorage.buffer = UnsafeMutablePointer.alloc(storage.capacity)
            newStorage.capacity = storage.capacity

            newStorage.buffer.initializeFrom(storage.buffer, count: storage.count)
            newStorage.count = storage.count

            storage = newStorage
        }
    }

}

// MARK: BinaryHeapType conformance
extension UnsafePtrHeap : BinaryHeapType {
    public var count: Int {
        return storage.count
    }

    public var first: Element? {
        return count > 0 ? storage.buffer.memory : nil
    }

    public mutating func insert(value: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == storage.capacity {
            reserveCapacity(count + 1)
        } else {
            ensureUniquelyReferenced()
        }

        storage.buffer.advancedBy(count).initialize(value)
        storage.count++

        var index = count - 1
        while index > 0 && (value < storage.buffer[parentIndex(index)]) {
            swap(&storage.buffer[index], &storage.buffer[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()

        storage.count = storage.count - 1
        if count > 0 {
            swap(&storage.buffer[0], &storage.buffer[count])
            heapify(storage.buffer, startIndex: 0, endIndex: count)
        }
        
        return storage.buffer.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        if isUniquelyReferenced(&storage) {
            // Destroy the elements & reuse storage
            storage.buffer.destroy(storage.count)
            
            if (!keepCapacity) {
                storage.buffer.dealloc(storage.capacity)
                storage.count = 0
                storage.capacity = 0
                storage.buffer = nil
            }
        } else {
            // Create new empty storage
            let currentCapacity = storage.capacity
            
            storage = UnsafePtrHeapStorage()
            if (keepCapacity) {
                reserveCapacity(currentCapacity)
            }
        }
    }
}

extension UnsafePtrHeap {
    internal mutating func forEach(@noescape body: (Element) throws -> Void) rethrows {
        ensureUniquelyReferenced()

        let buffer = storage.buffer
        for element in UnsafeBufferPointer(start: buffer, count: count) {
            try body(element)
        }
    }
}

// MARK: Printing
extension UnsafePtrHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

extension UnsafePtrHeap: _DestructorSafeContainer { }

