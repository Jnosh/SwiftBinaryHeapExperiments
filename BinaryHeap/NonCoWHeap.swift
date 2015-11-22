//
//  NonCoWHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 20/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

public final class NonCoWHeap<Element : Comparable> {
    /// The pointer to the elements.
    private var elements: UnsafeMutablePointer<Element>
    /// The capacity of `elements`.
    private var capacity: Int
    /// The number of elements that the buffer stores.
    public private(set) var count: Int

    public init() {
        elements = nil
        count = 0
        capacity = 0
    }

    deinit {
        elements.destroy(count)
        elements.dealloc(capacity)
    }

    private func reserveCapacity(minimumCapacity: Int) {
        if capacity < minimumCapacity {
            let (newElements, newCapacity) = UnsafeMutablePointer<Element>.allocSmart(minimumCapacity)
            newElements.moveInitializeBackwardFrom(elements, count: count)
            elements.dealloc(capacity)

            elements = newElements
            capacity = newCapacity
        }
    }
}

extension NonCoWHeap : BinaryHeapType {
    public var first: Element? {
        return count > 0 ? elements.memory : nil
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public func popFirst() -> Element? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }

    public func insert(value: Element) {
        if count == capacity {
            let requestedCapacity = max(2 * capacity, count + 1)
            reserveCapacity(requestedCapacity)
        }

        elements.advancedBy(count).initialize(value)
        count++

        var index = count - 1
        while index > 0 && (value < elements[parentIndex(index)]) {
            swap(&elements[index], &elements[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    public func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")

        count = count - 1
        if count > 0 {
            swap(&elements[0], &elements[count])
            heapify(elements, 0, count)
        }

        return elements.advancedBy(count).move()
    }

    public func removeAll(keepCapacity keepCapacity: Bool = false) {
        elements.destroy(count)
        count = 0

        if (!keepCapacity) {
            elements.dealloc(capacity)
            capacity = 0
            elements = nil
        }
    }
}

