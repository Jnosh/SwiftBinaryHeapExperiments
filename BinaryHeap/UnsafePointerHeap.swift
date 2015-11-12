//
//  UnsafePointerHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

// MARK: HeapBuffer

/// Storage class used to provide CoW
private final class PointerBuffer<Element : Comparable> : NonObjectiveCBase {
    /// The pointer to the elements.
    private var elements: UnsafeMutablePointer<Element>
    /// The capacity of `elements`.
    private var capacity: Int
    /// The number of elements that the buffer stores.
    private var count: Int

    private override init() {
        elements = nil
        count = 0
        capacity = 0
    }
    
    deinit {
        elements.destroy(count)
        elements.dealloc(capacity)
    }
}

// MARK: UnsafePointerHeap

/// Binary heap backed by an UnsafeMutablePointer to a buffer
public struct UnsafePointerHeap<Element : Comparable> {
    /// The buffer object backing this heap
    private var buffer: PointerBuffer<Element>

    private mutating func reserveCapacity(minimumCapacity: Int) {
        if buffer.capacity < minimumCapacity {
            // Allocate a new buffer
            let newCapacity = nextPoW2(minimumCapacity)
            let newElements = UnsafeMutablePointer<Element>.alloc(newCapacity)

            // Copy the contents to the new buffer
            // Destroy the old buffer in the process if we hold the only reference
            if isUniquelyReferenced(&buffer) {
                newElements.moveInitializeFrom(buffer.elements, count: count)
                buffer.elements.dealloc(buffer.capacity)
            } else {
                newElements.initializeFrom(buffer.elements, count: count)
                buffer = PointerBuffer()
            }

            buffer.elements = newElements
            buffer.capacity = newCapacity
        }
    }

    private mutating func ensureUniquelyReferenced() {
        if !isUniquelyReferenced(&buffer) {
            let newBuffer = PointerBuffer<Element>()
            
            newBuffer.elements = UnsafeMutablePointer.alloc(buffer.capacity)
            newBuffer.capacity = buffer.capacity

            newBuffer.elements.initializeFrom(buffer.elements, count: buffer.count)
            newBuffer.count = buffer.count

            buffer = newBuffer
        }
    }

}

// MARK: BinaryHeapType conformance
extension UnsafePointerHeap : BinaryHeapType {
    public init() {
        buffer = PointerBuffer()
    }
    
    public var count: Int {
        return buffer.count
    }

    public var first: Element? {
        return count > 0 ? buffer.elements.memory : nil
    }

    public mutating func insert(value: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == buffer.capacity {
            reserveCapacity(count + 1)
        } else {
            ensureUniquelyReferenced()
        }

        buffer.elements.advancedBy(count).initialize(value)
        buffer.count++

        var index = count - 1
        while index > 0 && (value < buffer.elements[parentIndex(index)]) {
            swap(&buffer.elements[index], &buffer.elements[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()

        buffer.count = buffer.count - 1
        if count > 0 {
            swap(&buffer.elements[0], &buffer.elements[count])
            heapify(buffer.elements, startIndex: 0, endIndex: count)
        }
        
        return buffer.elements.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        if isUniquelyReferenced(&buffer) {
            // Destroy the elements
            buffer.elements.destroy(buffer.count)
            buffer.count = 0

            if (!keepCapacity) {
                buffer.elements.dealloc(buffer.capacity)
                buffer.capacity = 0
                buffer.elements = nil
            }
        } else {
            // Create new empty storage
            let currentCapacity = buffer.capacity
            
            buffer = PointerBuffer()
            if (keepCapacity) {
                reserveCapacity(currentCapacity)
            }
        }
    }
}

extension UnsafePointerHeap {
    internal mutating func forEach(@noescape body: (Element) throws -> Void) rethrows {
        ensureUniquelyReferenced()

        for element in UnsafeBufferPointer(start: buffer.elements, count: count) {
            try body(element)
        }
    }
}

// MARK: Printing
extension UnsafePointerHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

extension UnsafePointerHeap: _DestructorSafeContainer { }

