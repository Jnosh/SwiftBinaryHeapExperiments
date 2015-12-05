//
//  StructElement.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 21/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// A small value type element
public struct ValueElementSmall : Comparable {
    var value: Int
    
    public init(_ value: Int) {
        self.value = value
    }
}

public func ==(lhs: ValueElementSmall, rhs: ValueElementSmall) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValueElementSmall, rhs: ValueElementSmall) -> Bool {
    return lhs.value < rhs.value
}

/// A medium value type element
public struct ValueElementMedium : Comparable {
    var value: Int
    
    let padding_0 = 0
    let padding_1 = 0
    let padding_2 = 0
    
    public init(_ value: Int) {
        self.value = value
    }
}

public func ==(lhs: ValueElementMedium, rhs: ValueElementMedium) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValueElementMedium, rhs: ValueElementMedium) -> Bool {
    return lhs.value < rhs.value
}

/// A large value type element
public struct ValueElementLarge : Comparable {
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

public func ==(lhs: ValueElementLarge, rhs: ValueElementLarge) -> Bool {
    return lhs.value == rhs.value
}

public func <(lhs: ValueElementLarge, rhs: ValueElementLarge) -> Bool {
    return lhs.value < rhs.value
}
