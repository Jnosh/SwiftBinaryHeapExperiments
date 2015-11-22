//
//  ManagedBufferHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 02/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by a ManagedBuffer
public struct ManagedBufferHeap<Element : Comparable> {
    private var buffer: ManagedArrayBuffer<Element>

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension ManagedBufferHeap : BinaryHeapType, BinaryHeapType_Fast {
    public init() {
        buffer = ManagedArrayBuffer()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> Element? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
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
            buffer.grow(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }
        
        buffer.count = count + 1
        buffer.withUnsafeMutablePointer { elements -> Void in
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
            buffer.grow(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }
        
        // FIXME: Workaround for http://www.openradar.me/23412050
        // Essentially buffer is retained for the closure call which costs us quite a bit of perf.
        buffer.count = count + 1
        var elements: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointer { ptr -> Void in
            ptr.advancedBy(count).initialize(element)
            elements = ptr
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
                heapify(elements, 0, count - 1)
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
            heapify(elements, 0, count - 1)
        }
        
        return elements.advancedBy(count - 1).move()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.removeAll(keepCapacity: keepCapacity)
    }
}

extension ManagedBufferHeap {
    internal mutating func forEach(body: (Element) -> Void) {
        buffer.ensureHoldsUniqueReference()

        let count = self.count
        buffer.withUnsafeMutablePointer { elements -> Void in
            for element in UnsafeBufferPointer(start: elements, count: count) {
                body(element)
            }
        }
    }
}

extension ManagedBufferHeap : _DestructorSafeContainer { }

