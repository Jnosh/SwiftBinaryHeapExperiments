//
//  ClassElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

/// A reference type element
public final class ReferenceElement: NSObject {
    var _value: Int
    
    public init(_ value: Int) {
        self._value = value
    }
}

extension ReferenceElement: Comparable {
}

public func ==(lhs: ReferenceElement, rhs: ReferenceElement) -> Bool {
    return lhs._value == rhs._value
}

public func <(lhs: ReferenceElement, rhs: ReferenceElement) -> Bool {
    return lhs._value < rhs._value
}
