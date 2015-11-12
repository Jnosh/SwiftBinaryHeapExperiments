//
//  PtrElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// An element that wraps an UnsafePointer to an Element
struct PtrElement<Element : Comparable> : Comparable {
    private let elementPtr: UnsafeMutablePointer<Element>
    
    var element: Element {
        return elementPtr.memory
    }
    
    init(_ element: Element) {
        let ptr = UnsafeMutablePointer<Element>.alloc(1)
        ptr.initialize(element)
        
        self.elementPtr = ptr
    }

    func destroy() {
        elementPtr.destroy(1)
        elementPtr.dealloc(1)
    }
}

func ==<Element>(lhs: PtrElement<Element>, rhs: PtrElement<Element>) -> Bool {
    return lhs.elementPtr.memory == rhs.elementPtr.memory
}

func <<Element>(lhs: PtrElement<Element>, rhs: PtrElement<Element>) -> Bool {
    return lhs.elementPtr.memory < rhs.elementPtr.memory
}

