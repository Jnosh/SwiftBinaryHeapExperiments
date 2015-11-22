//
//  ArrayPointerHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 02/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by an array but accessing the contents using `withUnsafeMutableBufferPointer`
public struct ArrayPointerHeap<Element : Comparable> {
    // MARK: Instance variables

    /// Heap is stored in an array
    /// We reuse CoW ability of underlying array
    private var storage: [Element]
}

// MARK: BinaryHeapType conformance
extension ArrayPointerHeap : BinaryHeapType, BinaryHeapType_Fast {
    public init() {
        storage = Array()
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
        return storage.count
    }

    public var first: Element? {
        return storage.first
    }

    public mutating func insert(value: Element) {
        var index = count
        storage.append(value)

        storage.withUnsafeMutableBufferPointer { buffer -> Void in
            while index > 0 && (value < buffer[parentIndex(index)]) {
                swap(&buffer[index], &buffer[parentIndex(index)])
                index = parentIndex(index)
            }
        }
    }

    public mutating func fastInsert(value: Element) {
        var index = count
        storage.append(value)
        
        // FIXME: Workaround for http://www.openradar.me/23412050
        // Essentially buffer is retained for the closure call which costs us quite a bit of perf.
        var elementPtr: UnsafeMutablePointer<Element> = nil
        storage.withUnsafeMutableBufferPointer { (inout buffer: UnsafeMutableBufferPointer<Element>) in
            elementPtr = buffer.baseAddress
        }
        
        while index > 0 && (value < elementPtr[parentIndex(index)]) {
            swap(&elementPtr[index], &elementPtr[parentIndex(index)])
            index = parentIndex(index)
        }
    }
    
    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")

        let count = storage.count
        if count > 1 {
            storage.withUnsafeMutableBufferPointer { buffer -> Void in
                swap(&buffer[0], &buffer[count - 1])
                heapify(buffer.baseAddress, 0, count - 1)
            }
        }

        return storage.removeLast()
    }
    
    public mutating func fastRemoveFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        
        // See fastInsert()
        let count = storage.count
        if count > 1 {
            var elementPtr: UnsafeMutablePointer<Element> = nil
            storage.withUnsafeMutableBufferPointer { (inout buffer: UnsafeMutableBufferPointer<Element>) in
                elementPtr = buffer.baseAddress
            }
            
            swap(&elementPtr[0], &elementPtr[count - 1])
            heapify(elementPtr, 0, count - 1)
        }
        
        return storage.removeLast()
    }


    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepCapacity: keepCapacity)
    }
}

