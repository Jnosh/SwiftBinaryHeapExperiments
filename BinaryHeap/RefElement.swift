//
//  ClassElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

/// A reference type element
public final class RefElement: NSObject {
    var value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

extension RefElement: Comparable {
}

public func ==(lhs: RefElement, rhs: RefElement) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: RefElement, rhs: RefElement) -> Bool {
    return lhs.value < rhs.value
}

extension RefElement: CFComparable {
    @objc public func compare(other: AnyObject) -> CFComparisonResult {
        let rhs: RefElement = unsafeDowncast(other)
        
        if value < rhs.value {
            return .CompareLessThan
        } else if value > rhs.value {
            return .CompareGreaterThan
        } else  {
            return .CompareEqualTo
        }
    }
}
