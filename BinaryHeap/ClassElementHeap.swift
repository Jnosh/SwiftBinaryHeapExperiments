//
//  ClassElementHeap2.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

public typealias AnyComparableObject = protocol<AnyObject, Comparable>

private struct Wrapper<Element: AnyComparableObject> : Comparable {
    let wrapped: Unmanaged<Element>

    init(_ element: Element) {
        wrapped = Unmanaged.passRetained(element)
    }

    var element: Element {
        return wrapped.takeUnretainedValue()
    }

    func consume() -> Element {
        return wrapped.takeRetainedValue()
    }

    func destroy() {
        wrapped.release()
    }
}

private func ==<Element>(lhs: Wrapper<Element>, rhs: Wrapper<Element>) -> Bool {
    return lhs.element == rhs.element
}

private func <<Element>(lhs: Wrapper<Element>, rhs: Wrapper<Element>) -> Bool {
    return lhs.element < rhs.element
}


public struct ClassElementHeap<Element: AnyComparableObject> {
    private var heap: UnsafePointerHeap<Wrapper<Element>>

    public init() {
        heap = UnsafePointerHeap()
    }
}

// MARK: BinaryHeapType conformance
extension ClassElementHeap : BinaryHeapType {
    public var count: Int {
        return heap.count
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

    public var first: Element? {
        return heap.first?.element
    }

    public mutating func insert(value: Element) {
        heap.insert(Wrapper(value))
    }

    public mutating func removeFirst() -> Element {
        return heap.removeFirst().consume()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.forEach { $0.destroy() }
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

