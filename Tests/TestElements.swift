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
    static let referenceElements = (0..<elementCount).map { _ in return RefElement(random()) }
    static let valueElements = (0..<elementCount).map { _ in return ValElementSmall(random()) }
}
