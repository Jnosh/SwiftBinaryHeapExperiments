//
//  PointerElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// An element that wraps an UnsafePointer to an Element
public struct PointerElement<Element : Comparable> : Comparable {
    private let elementPtr: UnsafeMutablePointer<Element>
    
    var element: Element {
        return elementPtr.memory
    }
    
    public init(_ element: Element) {
        let ptr = UnsafeMutablePointer<Element>.alloc(1)
        ptr.initialize(element)
        
        self.elementPtr = ptr
    }

    func destroy() {
        elementPtr.destroy(1)
        elementPtr.dealloc(1)
    }
}

public func ==<Element>(lhs: PointerElement<Element>, rhs: PointerElement<Element>) -> Bool {
    return lhs.elementPtr.memory == rhs.elementPtr.memory
}

public func <<Element>(lhs: PointerElement<Element>, rhs: PointerElement<Element>) -> Bool {
    return lhs.elementPtr.memory < rhs.elementPtr.memory
}

