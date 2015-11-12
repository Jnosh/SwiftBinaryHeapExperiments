//
//  ArrayHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 16/03/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by an array
public struct ArrayHeap<Element: Comparable> {
    // MARK: Instance variables

    /// Heap is stored in an array
    /// We reuse CoW property of underlying array
    private var storage: [Element]
}

// MARK: BinaryHeapType conformance
extension ArrayHeap : BinaryHeapType {
    public init() {
        storage = Array()
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

        while index > 0 && (value < storage[parentIndex(index)]) {
            swap(&storage[index], &storage[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
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

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepCapacity: keepCapacity)
    }
}

// MARK: Helper functions
extension ArrayHeap {
    /// Checks heap conditions at the given index and restores if not currently valid.
    private mutating func heapify(startIndex: Int) {
        assert(startIndex >= 0)

        let endIndex = count
        var index = startIndex
        while true {
            assert(index >= startIndex)
            assert(index < endIndex)

            let left = leftChildIndex(index)
            let right = rightChildIndex(index)

            // Find the minimum among the element at 'index' and its children
            var minIndex = left < endIndex && (storage[left] < storage[index]) ? left : index
            minIndex = right < endIndex && (storage[right] < storage[minIndex]) ? right : minIndex

            // Ensure the smallest element is at 'index' and recurs if neccessary
            // Using loop since we don't have guaranteed tail recursion
            if minIndex != index {
                swap(&storage[index], &storage[minIndex])
                index = minIndex
            } else {
                return
            }
        }
    }
}

// MARK: Printing
extension ArrayHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

extension ArrayHeap: _DestructorSafeContainer { }
