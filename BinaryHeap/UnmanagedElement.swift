//
//  UnmanagedElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//


struct UnmanagedElement<Element : protocol<Comparable, AnyObject>> : Comparable {
    let element: Unmanaged<Element>
    
    init(_ element: Element) {
        self.element = Unmanaged.passRetained(element)
    }
}

func ==<Element>(lhs: UnmanagedElement<Element>, rhs: UnmanagedElement<Element>) -> Bool {
    return lhs.element.takeUnretainedValue() == rhs.element.takeUnretainedValue()
}

func <<Element>(lhs: UnmanagedElement<Element>, rhs: UnmanagedElement<Element>) -> Bool {
    return lhs.element.takeUnretainedValue() < rhs.element.takeUnretainedValue()
}
