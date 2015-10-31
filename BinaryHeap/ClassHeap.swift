//
//  ClassHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

private struct Wrapper<Element: protocol<AnyObject, Comparable>> : Comparable {
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


public struct ClassHeap<Element: protocol<AnyObject, Comparable>> {
    private var heap: UnsafePtrHeap<Wrapper<Element>>

    public init() {
        heap = UnsafePtrHeap()
    }
}

// MARK: BinaryHeapType conformance
extension ClassHeap : BinaryHeapType {
    public var count: Int {
        return heap.count
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
        heap.apply { $0.destroy() }
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

// MARK: Printing
extension ClassHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return heap.debugDescription
    }

    public var description: String {
        return heap.description
    }
}

extension ClassHeap: _DestructorSafeContainer { }



