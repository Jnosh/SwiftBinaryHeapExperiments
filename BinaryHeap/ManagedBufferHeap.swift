//
//  ManagedBufferHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 02/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Wrapper for the instance variables stored with the ManagedBuffer
private struct ValueWrapper {
    var count: Int
    let capacity: Int
}

/// Our ManagedBuffer subclass that stores our instance variables and live elements
///
/// Some testing shows that as expected, ManagedBuffer stores the elements inline
/// to prevent a second pointer indirection
/// <class> <padding> <ValueWrapper> <padding> <elements>
private final class HeapBuffer<Element>: ManagedBuffer<ValueWrapper, Element> {
    /// Create a new HeapBuffer
    static func createBufferWithCapacity(capacity: Int) -> HeapBuffer<Element> {
        return HeapBuffer.create(capacity) {
            let capacity = $0.allocatedElementCount
            return ValueWrapper(count: 0, capacity: capacity)
        } as! HeapBuffer
    }

    /// Create a new HeapBuffer and copy the contents from the given buffer
    static func createCopyOfBuffer(buffer: HeapBuffer<Element>, capacity: Int) -> HeapBuffer<Element> {
        return buffer.withUnsafeMutablePointers{ (valuePtr, elementPtr) in
            let value = valuePtr.memory

            let newBuffer = HeapBuffer.createBufferWithCapacity(capacity)
            newBuffer.withUnsafeMutablePointers { (newValuePtr, newElementPtr) -> Void in
                newValuePtr.memory.count = value.count
                newElementPtr.initializeFrom(elementPtr, count: value.count)
            }
            return newBuffer
        }
    }

    /// Create a new HeapBuffer and move the contents from the given buffer over, removing its content
    ///
    /// This can be faster than creating a copy if the buffer is no longer needed
    /// as it combines the initialization of the new buffer contents
    /// and destruction of the old buffer contents into a single move
    static func createReplacementBuffer(buffer: HeapBuffer<Element>, capacity: Int) -> HeapBuffer<Element> {
        return buffer.withUnsafeMutablePointers{ (valuePtr, elementPtr) in
            let value = valuePtr.memory

            let newBuffer = HeapBuffer.createBufferWithCapacity(capacity)
            newBuffer.withUnsafeMutablePointers { (newValuePtr, newElementPtr) -> Void in
                newElementPtr.moveInitializeFrom(elementPtr, count: value.count)
                valuePtr.memory.count = 0
                newValuePtr.memory.count = value.count
            }
            return newBuffer
        }
    }

    deinit {
        // We own the elements in the buffer - destroy them
        withUnsafeMutablePointers { (valuePtr, elementPtr) -> Void in
            elementPtr.destroy(valuePtr.memory.count)
        }
    }
}

/// Binary heap backed by a ManagedBuffer
public struct ManagedBufferHeap<Element : Comparable> {
    // MARK: Instance variables
    private var buffer: HeapBuffer<Element>

    // MARK: CoW
    private mutating func ensureUniquelyReferenced() {
        if !isUniquelyReferenced(&buffer) {
            buffer = HeapBuffer.createCopyOfBuffer(buffer, capacity: capacity)
        }
    }

    private var capacity: Int {
        return buffer.value.capacity
    }

    private mutating func reserveCapacity(minimumCapacity: Int) {
        if capacity < minimumCapacity {
            let newCapacity = max(nextPoW2(minimumCapacity), 16)
            if isUniquelyReferenced(&buffer) {
                buffer = HeapBuffer.createReplacementBuffer(buffer, capacity: newCapacity)
            } else {
                buffer = HeapBuffer.createCopyOfBuffer(buffer, capacity: newCapacity)
            }
        }
    }
}

private func heapify<E : Comparable>(elements: UnsafeMutablePointer<E>, startIndex: Int, endIndex: Int) {
    assert(startIndex >= 0)

    var index = startIndex
    while true {
        assert(index >= startIndex)
        assert(index < endIndex)

        let leftIndex = leftChildIndex(index)
        let rightIndex = rightChildIndex(index)

        // Find the minimum among the element at 'index' and its children
        var minIndex = index
        if leftIndex < endIndex && (elements[leftIndex] < elements[index]) {
            minIndex = leftIndex
        }
        if rightIndex < endIndex && (elements[rightIndex] < elements[minIndex]) {
            minIndex = rightIndex
        }

        // Ensure the smallest element is at 'index' and recurse if neccessary
        if minIndex != index {
            swap(&elements[index], &elements[minIndex])
            index = minIndex
        } else {
            return
        }
    }
}


// MARK: BinaryHeapType conformance
extension ManagedBufferHeap : BinaryHeapType {
    public init() {
        buffer = HeapBuffer.createBufferWithCapacity(0)
    }

    public var count: Int {
        return buffer.value.count
    }

    public var first: Element? {
        return buffer.withUnsafeMutablePointers {
            let count = $0.memory.count
            return count > 0 ? $1.memory : nil
        }
    }

    public mutating func insert(element: Element) {
        let value = buffer.value
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if value.count == value.capacity {
            reserveCapacity(value.count + 1)
        } else {
            ensureUniquelyReferenced()
        }

        buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) -> Void in
            elementPtr.advancedBy(value.count).initialize(element)
            valuePtr.memory.count = value.count + 1

            var index = value.count
            while index > 0 && (element < elementPtr[parentIndex(index)]) {
                swap(&elementPtr[index], &elementPtr[parentIndex(index)])
                index = parentIndex(index)
            }
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()

        return buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) -> Element in
            let value = valuePtr.memory
            valuePtr.memory.count = value.count - 1

            if value.count > 1 {
                swap(&elementPtr[0], &elementPtr[value.count - 1])
                heapify(elementPtr, startIndex: 0, endIndex: value.count - 1)
            }

            return elementPtr.advancedBy(value.count - 1).move()
        }
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        let newCapacity = keepCapacity ? capacity : 0
        // TODO: actually keep current buffer?
        // Might make this dependant on whether we are uniquely referenced or not...
        // -> If uniquelyReferenced: Keep buffer but destroy elements
        // -> Else create new buffer (empty?)
        buffer = HeapBuffer.createBufferWithCapacity(newCapacity)
    }
}

// MARK: Initializers
/*
extension ManagedBufferHeap {
    public init<C: CollectionType where C.Generator.Element == Element>(elements: C) {
        let count = elements.underestimateCount()
        buffer = HeapBuffer.createBufferWithCapacity(count)

        buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) -> Void in
            elementPtr.initializeFrom(elements)
            valuePtr.memory.count = count

            // Heapify all non-leaves to create heap
            let stride = (count / 2).stride(to: 0, by: -1)
            for index in stride {
                heapify(elementPtr, startIndex: index, endIndex: count)
            }
        }
    }

    public init<S: SequenceType where S.Generator.Element == Element>(elements: S) {
        self.init(elements: Array(elements))
    }
}
*/

// MARK: Printing
extension ManagedBufferHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

extension ManagedBufferHeap: _DestructorSafeContainer { }

