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
    /// We reuse CoW ability of underlying array
    private var storage: [Element]
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

        storage.withUnsafeMutableBufferPointer { buffer in
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
            storage.withUnsafeMutableBufferPointer { buffer in
                swap(&buffer[0], &buffer[count - 1])
                heapify(buffer.baseAddress, startIndex: 0, endIndex: count - 1)
            }
        }

        return storage.removeLast()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        storage.removeAll(keepCapacity: keepCapacity)
    }
}

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
