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
/// Some testing shows that as expected, ManagedBuffer elements store the elements inline
/// to prevent a second pointer indirection
/// <class> <padding> <ValueWrapper> <padding> <elements>
private final class HeapBuffer<Element>: ManagedBuffer<ValueWrapper, Element> {
    /// Create a new HeapBuffer
    static func createBufferWithCapacity(capacity: Int) -> HeapBuffer<Element> {
        let buffer = HeapBuffer.create(capacity) {
            let effectiveCapacity = $0.allocatedElementCount
            return ValueWrapper(count: 0, capacity: effectiveCapacity)
        }
        
        return buffer as! HeapBuffer
    }

    /// Create a new HeapBuffer and copy the contents from the given buffer
    static func createCopyOfBuffer(buffer: HeapBuffer<Element>, capacity: Int) -> HeapBuffer<Element> {
        return buffer.withUnsafeMutablePointers{ (valuePtr, elementPtr) in
            let currentCount = valuePtr.memory.count
            
            let newBuffer = HeapBuffer<Element>.createBufferWithCapacity(capacity)
            newBuffer.withUnsafeMutablePointers { (newValuePtr, newElementPtr) in
                newElementPtr.initializeFrom(elementPtr, count: currentCount)
                newValuePtr.memory.count = currentCount
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
        return buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) in
            let currentCount = valuePtr.memory.count

            let newBuffer = HeapBuffer.createBufferWithCapacity(capacity)
            newBuffer.withUnsafeMutablePointers { (newValuePtr, newElementPtr) in
                newElementPtr.moveInitializeFrom(elementPtr, count: currentCount)
                valuePtr.memory.count = 0
                newValuePtr.memory.count = currentCount
            }
            return newBuffer
        }
    }

    deinit {
        // We own the elements in the buffer - destroy them
        withUnsafeMutablePointers { (valuePtr, elementPtr) in
            valuePtr.destroy()
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
            let newCapacity = max(16, nextPoW2(minimumCapacity))
            if isUniquelyReferenced(&buffer) {
                buffer = HeapBuffer.createReplacementBuffer(buffer, capacity: newCapacity)
            } else {
                buffer = HeapBuffer.createCopyOfBuffer(buffer, capacity: newCapacity)
            }
        }
    }
}

// MARK: BinaryHeapType conformance
extension ManagedBufferHeap : BinaryHeapType, BinaryHeapType_Fast {
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
        
        buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) in
            elementPtr.advancedBy(value.count).initialize(element)
            valuePtr.memory.count = value.count + 1
            
            var index = value.count
            while index > 0 && (element < elementPtr[parentIndex(index)]) {
                swap(&elementPtr[index], &elementPtr[parentIndex(index)])
                index = parentIndex(index)
            }
        }
    }

    public mutating func fastInsert(element: Element) {
        let value = buffer.value
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if value.count == value.capacity {
            reserveCapacity(value.count + 1)
        } else {
            ensureUniquelyReferenced()
        }
        
        // FIXME: Workaround for rdar://23412050
        // Essentially buffer is retained for the closure call which costs us quite a bit of perf.
        var elementPtr: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointers { (valuePtr, ptr) in
            elementPtr = ptr
            elementPtr.advancedBy(value.count).initialize(element)
            valuePtr.memory.count = value.count + 1
        }
        
        var index = value.count
        while index > 0 && (element < elementPtr[parentIndex(index)]) {
            swap(&elementPtr[index], &elementPtr[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()

        return buffer.withUnsafeMutablePointers { (valuePtr, elementPtr) in
            let value = valuePtr.memory
            valuePtr.memory.count = value.count - 1
            
            if value.count > 1 {
                swap(&elementPtr[0], &elementPtr[value.count - 1])
                heapify(elementPtr, startIndex: 0, endIndex: value.count - 1)
            }
            
            return elementPtr.advancedBy(value.count - 1).move()
        }
    }
    
    public mutating func fastRemoveFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()
        
        var elementPtr: UnsafeMutablePointer<Element> = nil
        var count = 0
        buffer.withUnsafeMutablePointers { (valuePtr, ptr) in
            let value = valuePtr.memory
            valuePtr.memory.count = value.count - 1
            
            count = value.count
            elementPtr = ptr
        }
        
        if count > 1 {
            swap(&elementPtr[0], &elementPtr[count - 1])
            heapify(elementPtr, startIndex: 0, endIndex: count - 1)
        }
        
        return elementPtr.advancedBy(count - 1).move()
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

