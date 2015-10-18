//
//  PtrElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

struct PtrElement<Element : Comparable> : Comparable {
    let elementPtr: UnsafePointer<Element>
    
    init(_ element: Element) {
        let ptr = UnsafeMutablePointer<Element>.alloc(1)
        ptr.initialize(element)
        
        self.elementPtr = UnsafePointer(ptr)
    }
}

func ==<Element>(lhs: PtrElement<Element>, rhs: PtrElement<Element>) -> Bool {
    return lhs.elementPtr.memory == rhs.elementPtr.memory
}

func <<Element>(lhs: PtrElement<Element>, rhs: PtrElement<Element>) -> Bool {
    return lhs.elementPtr.memory < rhs.elementPtr.memory
}

