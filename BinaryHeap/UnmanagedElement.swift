//
//  UnmanagedElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// An element that wraps an Unmanaged reference type
public struct UnmanagedElement<Element : protocol<Comparable, AnyObject>> : Comparable {
    private let wrapped: Unmanaged<Element>
    
    var element: Element {
        return wrapped.takeUnretainedValue()
    }
    
    public init(_ element: Element) {
        wrapped = Unmanaged.passRetained(element)
    }

    func destroy() {
        wrapped.release()
    }
}

public func ==<Element>(lhs: UnmanagedElement<Element>, rhs: UnmanagedElement<Element>) -> Bool {
    return lhs.wrapped.takeUnretainedValue() == rhs.wrapped.takeUnretainedValue()
}

public func <<Element>(lhs: UnmanagedElement<Element>, rhs: UnmanagedElement<Element>) -> Bool {
    return lhs.wrapped.takeUnretainedValue() < rhs.wrapped.takeUnretainedValue()
}
