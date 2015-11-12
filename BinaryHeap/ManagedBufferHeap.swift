//
//  ManagedBufferHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 02/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by a ManagedBuffer
public struct ManagedBufferHeap<Element : Comparable> {
    private var buffer: HeapBuffer<Element>

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension ManagedBufferHeap : BinaryHeapType, BinaryHeapType_Fast {
    public init() {
        buffer = HeapBuffer()
    }

    public var count: Int {
        return buffer.count
    }

    public var first: Element? {
        return count > 0 ? buffer.withUnsafeMutablePointer { $0.memory } : nil
    }

    public mutating func insert(element: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        let count = self.count
        if count == buffer.capacity {
            reserveCapacity(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }
        
        buffer.count = count + 1
        buffer.withUnsafeMutablePointer { elements in
            elements.advancedBy(count).initialize(element)
            
            var index = count
            while index > 0 && (element < elements[parentIndex(index)]) {
                swap(&elements[index], &elements[parentIndex(index)])
                index = parentIndex(index)
            }
        }
    }

    public mutating func fastInsert(element: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        let count = self.count
        if count == buffer.capacity {
            reserveCapacity(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }
        
        // FIXME: Workaround for http://www.openradar.me/23412050
        // Essentially buffer is retained for the closure call which costs us quite a bit of perf.
        buffer.count = count + 1
        var elements: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointer {
            $0.advancedBy(count).initialize(element)
            elements = $0
        }
        
        var index = count
        while index > 0 && (element < elements[parentIndex(index)]) {
            swap(&elements[index], &elements[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        buffer.ensureHoldsUniqueReference()

        let count = self.count
        buffer.count = count - 1
        return buffer.withUnsafeMutablePointer { elements in
            if count > 1 {
                swap(&elements[0], &elements[count - 1])
                heapify(elements, startIndex: 0, endIndex: count - 1)
            }
            
            return elements.advancedBy(count - 1).move()
        }
    }
    
    public mutating func fastRemoveFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        buffer.ensureHoldsUniqueReference()
        
        // See fastInsert.
        let count = self.count
        buffer.count = count - 1
        var elements: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointer { elements = $0 }
        
        if count > 1 {
            swap(&elements[0], &elements[count - 1])
            heapify(elements, startIndex: 0, endIndex: count - 1)
        }
        
        return elements.advancedBy(count - 1).move()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        if buffer.holdsUniqueReference() && keepCapacity {
            // Destroy the elements but keep the buffer
            let count = self.count
            buffer.count = 0
            buffer.withUnsafeMutablePointer { $0.destroy(count) }
        } else {
            // Create a new buffer
            let newCapacity = keepCapacity ? buffer.capacity : 0
            buffer = HeapBuffer(minimumCapacity: newCapacity)
        }
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

