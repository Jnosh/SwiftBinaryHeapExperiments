//
//  NonCoWHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 23/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class NonCoWHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: Tests
    func testInsert() {
        runInsertTest(NonCoWHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(NonCoWHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemove() {
        runRemoveTest(NonCoWHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(NonCoWHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemoveAll() {
        runRemoveAllTest(NonCoWHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(NonCoWHeap.self, elements: TestElements.valueElements)
    }
    
    func testOrder() {
        runOrderTest(NonCoWHeap.self, elements: TestElements.referenceElements)
        runOrderTest(NonCoWHeap.self, elements: TestElements.valueElements)
    }
}
