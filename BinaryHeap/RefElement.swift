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
final class RefElement {
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
