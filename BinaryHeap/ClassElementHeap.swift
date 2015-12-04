//
//  ClassElementHeap2.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

public typealias AnyComparableObject = protocol<AnyObject, Comparable>

private struct Wrapper<Element : AnyComparableObject> : Comparable {
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


/// A heap specialized for `AnyObject`s.
///
/// Uses `Unmanaged` instances internally to avoid any ARC overhead.
public struct ClassElementHeap<Element : AnyComparableObject> {
    /// The buffer object backing this heap
    private var buffer: ArrayBuffer<Wrapper<Element>>

    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension ClassElementHeap : BinaryHeapType {
    public init() {
        buffer = ArrayBuffer(minimumCapacity: 0, retainElementsOnCopy: true)
    }

    public var count: Int {
        return buffer.count
    }

    public var first: Element? {
        return count > 0 ? buffer.elements.memory.element : nil
    }

    public mutating func insert(_value: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == buffer.capacity {
            buffer.grow(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }

        let value = Wrapper(_value)
        buffer.elements.advancedBy(count).initialize(value)
        buffer.count = buffer.count + 1

        var index = count - 1
        while index > 0 && (value < buffer.elements[parentIndex(index)]) {
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

        return buffer.elements.advancedBy(count).move().consume()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.ensureHoldsUniqueReference()

        // Release unamaged objects
        for element in UnsafeBufferPointer(start: buffer.elements, count: count) {
            element.consume()
        }

        buffer.removeAll(keepCapacity: keepCapacity)
    }
}


extension ClassElementHeap : CustomDebugStringConvertible, CustomStringConvertible { }
