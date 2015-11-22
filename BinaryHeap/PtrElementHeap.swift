//
//  PtrElementHeap.swift
//  BinaryHeaps
//
//  Created by Janosch Hildebrand on 13/04/15.
//  Copyright (c) 2015 Janosch Hildebrand. All rights reserved.
//

public struct PtrElementHeap<E: Comparable> {
    // MARK: Instance variables
    private var storage: [UnsafePointer<E>]
}

// MARK: Helper functions
extension PtrElementHeap {
    /// Checks heap conditions at the given index and restores if not currently valid.
    private mutating func heapify(startIndex: Int) {
        assert(startIndex >= 0)

        let endIndex = count
        var index = startIndex
        while true {
            assert(index >= 0 && index < endIndex)

            let left = leftChildIndex(index)
            let right = rightChildIndex(index)

            // Find the minimum among the element at 'index' and its children
            var minIndex = left < endIndex && storage[left] < storage[index] ? left : index
            minIndex = right < endIndex && storage[right] < storage[minIndex] ? right : minIndex

            // Ensure the smallest element is at 'index' and recurse if neccessary
            if minIndex != index {
                swap(&storage[index], &storage[minIndex])
                index = minIndex
            } else {
                return
            }
        }
    }
}


// MARK: Public Properties
extension PtrElementHeap : BinaryHeapType {
    /// The number of values contained in this heap
    public var count: Int {
        return storage.count
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> UnsafePointer<E>? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }

    /// The smallest element on the heap as ordered by the comparison function
    /// or nil if the heap is empty.
    public var first: UnsafePointer<E>? {
        return storage.first
    }

    /// The current capacity of the heap storage
    public var capacity: Int {
        return storage.capacity
    }

    /// An array containing all the elements of this heap
    public var array: [UnsafePointer<E>] {
        return storage
    }
}

// MARK: Public Functions
extension PtrElementHeap {
    /// Insert a new element into the heap.
    public mutating func insert(value: UnsafePointer<E>) {
        var index = count
        storage.append(value)

        while index > 0 && value < storage[parentIndex(index)] {
            swap(&storage[index], &storage[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    /// Remove the root element (the smallest element) from the heap and return it
    public mutating func removeFirst() -> UnsafePointer<E> {
        precondition(!isEmpty, "Heap may not be empty.")

        if storage.count > 1 {
            let root = storage[0]

            storage[0] = storage.removeLast()
            heapify(0)

            return root
        } else {
            return storage.removeLast()
        }
    }

    /// Remove all elements from the heap
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepCapacity: keepCapacity)
    }
}

// MARK: Initializers
extension PtrElementHeap {
    /// Initialize an empty heap using the given ordering
    public init() {
        storage = Array()
    }
}
