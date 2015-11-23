//
//  StructElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

/// A small value type element
public struct ValElementSmall : Comparable {
    var value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

public func ==(lhs: ValElementSmall, rhs: ValElementSmall) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValElementSmall, rhs: ValElementSmall) -> Bool {
    return lhs.value < rhs.value
}

/// A medium value type element
public struct ValElementMedium : Comparable {
    var value: Int
    
    let padding_0 = 0
    let padding_1 = 0
    let padding_2 = 0
    
    public init(_ value: Int) {
        self.value = value
    }
}

public func ==(lhs: ValElementMedium, rhs: ValElementMedium) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValElementMedium, rhs: ValElementMedium) -> Bool {
    return lhs.value < rhs.value
}

/// A large value type element
public struct ValElementLarge : Comparable {
    var value: Int
    
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
    
    public init(_ value: Int) {
        self.value = value
    }
}

public func ==(lhs: ValElementLarge, rhs: ValElementLarge) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValElementLarge, rhs: ValElementLarge) -> Bool {
    return lhs.value < rhs.value
}
