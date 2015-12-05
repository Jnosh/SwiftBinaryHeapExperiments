//
//  UnsafePointerHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/04/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap backed by an UnsafeMutablePointer to a buffer
public struct UnsafePointerHeap<Element : Comparable> {
    /// The buffer object backing this heap
    private var buffer: ArrayBuffer<Element>

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension UnsafePointerHeap : BinaryHeapType {
    public init() {
        buffer = ArrayBuffer()
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
        return count > 0 ? buffer.elements.memory : nil
    }

    public mutating func insert(value: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == buffer.capacity {
            buffer.grow(count + 1)
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
        
        buffer.count = buffer.count - 1
        if count > 0 {
            swap(&buffer.elements[0], &buffer.elements[count])
            heapify(buffer.elements, 0, count)
        }
        
        return buffer.elements.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.removeAll(keepCapacity: keepCapacity)
    }
}

