//
//  ClosureUnsafePointerHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap that supports using a closure for element comparison instead of Comparable
///
/// - The closure is stored in the ClosureHeap struct to simplify implementation
/// - Backed by an UnsafeMutablePointer to a buffer
public struct ClosureUnsafePointerHeap<Element> {
    private var buffer: ArrayBuffer<Element>
    private let isOrderedBefore: (Element, Element) -> Bool

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension ClosureUnsafePointerHeap : ClosureBinaryHeapType {
    public init(isOrderedBefore: (Element, Element) -> Bool) {
        buffer = ArrayBuffer()
        self.isOrderedBefore = isOrderedBefore
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
        } else {
            buffer.ensureHoldsUniqueReference()
        }

        buffer.elements.advancedBy(count).initialize(value)
        buffer.count++

        var index = count - 1
        while index > 0 && isOrderedBefore(value, buffer.elements[parentIndex(index)]) {
            swap(&buffer.elements[index], &buffer.elements[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        buffer.ensureHoldsUniqueReference()

        buffer.count = buffer.count - 1
        if count > 0 {
            swap(&buffer.elements[0], &buffer.elements[count])
            heapify(buffer.elements, 0, count, isOrderedBefore)
        }

        return buffer.elements.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.removeAll(keepCapacity: keepCapacity)
    }
}

extension ClosureUnsafePointerHeap : _DestructorSafeContainer { }
