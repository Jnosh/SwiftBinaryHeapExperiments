//
//  UnsafePtrHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

private final class UnsafePtrHeapStorage<Element : Comparable> : NonObjectiveCBase {
    private var buffer: UnsafeMutablePointer<Element>
    private var capacity: Int
    private var count: Int

    private override init() {
        buffer = nil
        count = 0
        capacity = 0
    }
}

public struct UnsafePtrHeap<Element : Comparable> {
    private var storage: UnsafePtrHeapStorage<Element>

    public init() {
        storage = UnsafePtrHeapStorage()
    }

    private mutating func reserveCapacity(minimumCapacity: Int) {
        if storage.capacity < minimumCapacity {
            let newCapacity = max(nextPoW2(minimumCapacity), 16)
            let newBuffer = UnsafeMutablePointer<Element>.alloc(newCapacity)

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
            newStorage.capacity = storage.capacity
            newStorage.count = storage.count

            newStorage.buffer = UnsafeMutablePointer.alloc(newStorage.capacity)
            newStorage.buffer.initializeFrom(storage.buffer, count: storage.count)

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

        if count > 1 {
            let root = storage.buffer[0]

            storage.buffer[0] = storage.buffer[--storage.count]
            heapify(storage.buffer, startIndex: 0, endIndex: count)

            return root
        } else {
            storage.count = 0
            return storage.buffer.move()
        }
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        ensureUniquelyReferenced()

        storage.buffer.destroy(storage.count)
        storage.buffer.dealloc(storage.capacity)
        storage.count = 0
        storage.capacity = 0
        storage.buffer = nil
    }
}

extension UnsafePtrHeap {
    internal mutating func apply(@noescape f: (Element) throws -> Void) rethrows {
        ensureUniquelyReferenced()

        let buffer = storage.buffer
        for element in UnsafeBufferPointer(start: buffer, count: count) {
            try f(element)
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

