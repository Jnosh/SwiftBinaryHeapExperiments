//
//  ClosureArrayBufferHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 23/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ClosureArrayBufferHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    // MARK: Tests
    func testInsert() {
        runInsertTest(ClosureArrayBufferHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ClosureArrayBufferHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemove() {
        runRemoveTest(ClosureArrayBufferHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ClosureArrayBufferHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemoveAll() {
        runRemoveAllTest(ClosureArrayBufferHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ClosureArrayBufferHeap.self, elements: TestElements.valueElements)
    }
    
    func testOrder() {
        runOrderTest(ClosureArrayBufferHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ClosureArrayBufferHeap.self, elements: TestElements.valueElements)
    }
    
    func testCoW() {
        runCoWTest(ClosureArrayBufferHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ClosureArrayBufferHeap.self, elements: TestElements.valueElements)
    }
}
