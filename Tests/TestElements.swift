//
//  TestElements.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 04/04/15.
//  Copyright (c) 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Framework

struct TestElements {
    static let capacity = 1000
    static let maxBaseCapacity = 16

    static let elementCount = 10000
    static let referenceElements = (0..<elementCount).map { _ in return RefElement() }
    static let valueElements = (0..<elementCount).map { _ in return ValElement() }
}


class RefElement : NSObject {
    var value: Int = Int(arc4random())
}

extension RefElement : Comparable { }

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


struct ValElement : Comparable {
    var value: Int = Int(arc4random())
}

func ==(lhs: ValElement, rhs: ValElement) -> Bool {
    return lhs.value == rhs.value
}

func <(lhs: ValElement, rhs: ValElement) -> Bool {
    return lhs.value < rhs.value
}
