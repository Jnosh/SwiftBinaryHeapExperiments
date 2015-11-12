//
//  ClassElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Framework

/// A reference type element
final class RefElement: NSObject {
    var value: Int = Int(arc4random())
}

extension RefElement: Comparable {
}

func ==(lhs: RefElement, rhs: RefElement) -> Bool {
    return lhs.value == rhs.value
}

func <(lhs: RefElement, rhs: RefElement) -> Bool {
    return lhs.value < rhs.value
}

extension RefElement: CFComparable {
    @objc func compare(other: AnyObject) -> CFComparisonResult {
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

extension RefElement : Framework.CFComparable {
}

