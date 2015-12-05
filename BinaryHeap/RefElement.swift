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
    var value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

extension ReferenceElement: Comparable {
}

public func ==(lhs: ReferenceElement, rhs: ReferenceElement) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ReferenceElement, rhs: ReferenceElement) -> Bool {
    return lhs.value < rhs.value
}

extension ReferenceElement: CFComparable {
    @objc public func compare(other: AnyObject) -> CFComparisonResult {
        let rhs: ReferenceElement = unsafeDowncast(other)
        
        if value < rhs.value {
            return .CompareLessThan
        } else if value > rhs.value {
            return .CompareGreaterThan
        } else  {
            return .CompareEqualTo
        }
    }
}
