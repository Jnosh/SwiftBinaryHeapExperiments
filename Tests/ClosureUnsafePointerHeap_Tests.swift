//
//  ClosureUnsafePointerHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 23/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//


import XCTest
import Framework

class ClosureUnsafePointerHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: Tests
    func testInsert() {
        runInsertTest(ClosureUnsafePointerHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ClosureUnsafePointerHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemove() {
        runRemoveTest(ClosureUnsafePointerHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ClosureUnsafePointerHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemoveAll() {
        runRemoveAllTest(ClosureUnsafePointerHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ClosureUnsafePointerHeap.self, elements: TestElements.valueElements)
    }
    
    func testOrder() {
        runOrderTest(ClosureUnsafePointerHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ClosureUnsafePointerHeap.self, elements: TestElements.valueElements)
    }
    
    func testCoW() {
        runCoWTest(ClosureUnsafePointerHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ClosureUnsafePointerHeap.self, elements: TestElements.valueElements)
    }
}
