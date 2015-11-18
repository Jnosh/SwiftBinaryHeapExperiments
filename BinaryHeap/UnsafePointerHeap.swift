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
            reserveCapacity(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
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

extension UnsafePointerHeap {
    internal mutating func forEach(@noescape body: (Element) throws -> Void) rethrows {
        buffer.ensureHoldsUniqueReference()
        
        for element in UnsafeBufferPointer(start: buffer.elements, count: count) {
            try body(element)
        }
    }
}


extension UnsafePointerHeap : CustomDebugStringConvertible, CustomStringConvertible { }
extension UnsafePointerHeap : _DestructorSafeContainer { }

