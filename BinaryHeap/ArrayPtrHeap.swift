//
//  ArrayPtrHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 02/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by an array but operating on the raw memory contents
public struct ArrayPtrHeap<Element : Comparable> {
    // MARK: Instance variables

    /// Heap is stored in an array
    /// We reuse COW of underlying array
    private var storage: [Element]
}

// MARK: Helper functions
extension ArrayPtrHeap {
    /// Checks heap conditions at the given index and restores if not currently valid.
    private func heapify(buffer: UnsafeMutableBufferPointer<Element>, startIndex: Int, endIndex: Int) {
        assert(startIndex >= 0)
        assert(endIndex <= buffer.endIndex)

        var index = startIndex
        while true {
            assert(index >= startIndex)
            assert(index < endIndex)

            let leftIndex = leftChildIndex(index)
            let rightIndex = rightChildIndex(index)

            // Find the minimum among the element at 'index' and its children
            var minIndex = index
            if leftIndex < endIndex && (buffer[leftIndex] < buffer[index]) {
                minIndex = leftIndex
            }
            if rightIndex < endIndex && (buffer[rightIndex] < buffer[minIndex]) {
                minIndex = rightIndex
            }

            // Ensure the smallest element is at 'index' and repeat if neccessary
            if minIndex != index {
                swap(&buffer[index], &buffer[minIndex])
                index = minIndex
            } else {
                return
            }
        }
    }
}

// MARK: BinaryHeapType conformance
extension ArrayPtrHeap : BinaryHeapType {
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

        storage.withUnsafeMutableBufferPointer {
            (inout buffer: UnsafeMutableBufferPointer<Element>) -> Void in

            while index > 0 && (value < buffer[parentIndex(index)]) {
                swap(&buffer[index], &buffer[parentIndex(index)])
                index = parentIndex(index)
            }
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")

        let count = storage.count
        if count > 1 {
            storage.withUnsafeMutableBufferPointer {
                (inout buffer: UnsafeMutableBufferPointer<Element>) -> Void in

                swap(&buffer[0], &buffer[count - 1])
                heapify(buffer, startIndex: 0, endIndex: count - 1)
            }
        }

        return storage.removeLast()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepCapacity: keepCapacity)
    }
}

/*
extension ArrayPtrHeap {
    public init<S: SequenceType where S.Generator.Element == Element>(elements: S) {
        storage = Array(elements)

        storage.withUnsafeMutableBufferPointer {
            (inout buffer: UnsafeMutableBufferPointer<Element>) -> Void in

            // Heapify all non-leaves to create heap
            let stride = (buffer.count / 2).stride(to: 0, by: -1)
            for index in stride {
                heapify(buffer, startIndex: index, endIndex: buffer.count)
            }
        }
    }
}
*/

// MARK: Printing
extension ArrayPtrHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

extension ArrayPtrHeap: _DestructorSafeContainer { }
