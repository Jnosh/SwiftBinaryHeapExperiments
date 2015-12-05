//
//  ClosureManagedBufferHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 23/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ClosureManagedBufferHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: Tests
    func testInsert() {
        runInsertTest(ClosureManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ClosureManagedBufferHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemove() {
        runRemoveTest(ClosureManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ClosureManagedBufferHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemoveAll() {
        runRemoveAllTest(ClosureManagedBufferHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ClosureManagedBufferHeap.self, elements: TestElements.valueElements)
    }
    
    func testOrder() {
        runOrderTest(ClosureManagedBufferHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ClosureManagedBufferHeap.self, elements: TestElements.valueElements)
    }
    
    func testCoW() {
        runCoWTest(ClosureManagedBufferHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ClosureManagedBufferHeap.self, elements: TestElements.valueElements)
    }
}
