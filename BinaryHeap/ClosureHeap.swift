//
//  ClosureHeap2.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//


public struct ClosureHeap<Element> {
    private var buffer: ArrayBuffer<Element>
    private let isOrderedBefore: (Element, Element) -> Bool

    public init(isOrderedBefore: (Element, Element) -> Bool) {
        buffer = ArrayBuffer()
        self.isOrderedBefore = isOrderedBefore
    }

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }

    private func heapify(elements: UnsafeMutablePointer<Element>, startIndex: Int, endIndex: Int) {
        assert(startIndex >= 0)

        var index = startIndex
        while true {
            assert(index >= startIndex)
            assert(index < endIndex)

            let leftIndex = leftChildIndex(index)
            let rightIndex = rightChildIndex(index)

            // Find the minimum among the element at 'index' and its children
            var minIndex = index
            if leftIndex < endIndex && isOrderedBefore(elements[leftIndex], elements[index]) {
                minIndex = leftIndex
            }
            if rightIndex < endIndex && isOrderedBefore(elements[rightIndex], elements[minIndex]) {
                minIndex = rightIndex
            }

            // Ensure the smallest element is at 'index' and recurse if neccessary
            if minIndex != index {
                swap(&elements[index], &elements[minIndex])
                index = minIndex
            } else {
                return
            }
        }
    }
}

// MARK: BinaryHeapType conformance
extension ClosureHeap : BinaryHeapType_Alt {
    public var count: Int {
        return buffer.count
    }

    public var first: Element? {
        return count > 0 ? buffer.elements.memory : nil
    }

    public var isEmpty: Bool {
        return count == 0
    }

    public mutating func insert(value: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == buffer.capacity {
            reserveCapacity(count + 1)
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
            heapify(buffer.elements, startIndex: 0, endIndex: count)
        }

        return buffer.elements.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.removeAll(keepCapacity: keepCapacity)
    }
}


extension ClosureHeap : CustomDebugStringConvertible, CustomStringConvertible { }
extension ClosureHeap : _DestructorSafeContainer { }
