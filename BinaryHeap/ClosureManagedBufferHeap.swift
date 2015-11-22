//
//  ClosureManagedBufferHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Binary heap that supports using a closure for element comparison instead of Comparable
///
/// - The closure is stored in the ClosureHeap struct to simplify implementation
/// - Backed by a ManagedBuffer
public struct ClosureManagedBufferHeap<Element> {
    private var buffer: ManagedArrayBuffer<Element>
    private let isOrderedBefore: (Element, Element) -> Bool
    
    private mutating func reserveCapacity(minimumCapacity: Int) {
        buffer.reserveCapacity(minimumCapacity)
    }
}

// MARK: BinaryHeapType conformance
extension ClosureManagedBufferHeap : ClosureBinaryHeapType {
    public init(isOrderedBefore: (Element, Element) -> Bool) {
        buffer = ManagedArrayBuffer()
        self.isOrderedBefore = isOrderedBefore
    }
    
    public var count: Int {
        return buffer.count
    }
    
    public var first: Element? {
        return count > 0 ? buffer.withUnsafeMutablePointer { $0.memory } : nil
    }
    
    public mutating func insert(element: Element) {
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        let count = self.count
        if count == buffer.capacity {
            buffer.grow(count + 1)
        } else {
            buffer.ensureHoldsUniqueReference()
        }
        
        // FIXME: Workaround for http://www.openradar.me/23412050
        // Essentially buffer is retained for the closure call which costs us quite a bit of perf.
        buffer.count = count + 1
        var elements: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointer {
            $0.advancedBy(count).initialize(element)
            elements = $0
        }
        
        var index = count
        while index > 0 && isOrderedBefore(element, elements[parentIndex(index)]) {
            swap(&elements[index], &elements[parentIndex(index)])
            index = parentIndex(index)
        }
    }
    
    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        buffer.ensureHoldsUniqueReference()
        
        // See fastInsert.
        let count = self.count
        buffer.count = count - 1
        var elements: UnsafeMutablePointer<Element> = nil
        buffer.withUnsafeMutablePointer { elements = $0 }
        
        if count > 1 {
            swap(&elements[0], &elements[count - 1])
            heapify(elements, startIndex: 0, endIndex: count - 1, isOrderedBefore: isOrderedBefore)
        }
        
        return elements.advancedBy(count - 1).move()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        buffer.removeAll(keepCapacity: keepCapacity)
    }
}


extension ClosureManagedBufferHeap : CustomDebugStringConvertible, CustomStringConvertible { }

