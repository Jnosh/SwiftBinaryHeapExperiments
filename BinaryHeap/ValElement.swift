//
//  StructElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

/// A small value type element
struct ValElementSmall : Comparable {
    var value: Int = Int(arc4random())
}

func ==(lhs: ValElementSmall, rhs: ValElementSmall) -> Bool {
    return lhs.value == rhs.value
}

func <(lhs: ValElementSmall, rhs: ValElementSmall) -> Bool {
    return lhs.value < rhs.value
}

/// A medium value type element
struct ValElementMedium : Comparable {
    var value: Int = Int(arc4random())
    
    let padding_0 = 0
    let padding_1 = 0
    let padding_2 = 0
}

func ==(lhs: ValElementMedium, rhs: ValElementMedium) -> Bool {
    return lhs.value == rhs.value
}

func <(lhs: ValElementMedium, rhs: ValElementMedium) -> Bool {
    return lhs.value < rhs.value
}

/// A large value type element
struct ValElementLarge : Comparable {
    var value: Int = Int(arc4random())
    
    let padding_0 = 0
    let padding_1 = 0
    let padding_2 = 0
    let padding_3 = 0
    let padding_4 = 0
    let padding_5 = 0
    let padding_6 = 0
    let padding_7 = 0
    let padding_8 = 0
    let padding_9 = 0
    let padding_10 = 0
}

func ==(lhs: ValElementLarge, rhs: ValElementLarge) -> Bool {
    return lhs.value == rhs.value
}

func <(lhs: ValElementLarge, rhs: ValElementLarge) -> Bool {
    return lhs.value < rhs.value
}
