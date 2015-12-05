//
//  ManagedBufferHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ManagedBufferHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: Tests
    func testInsert() {
        runInsertTest(ManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ManagedBufferHeap.self, element: TestElements.valueElements[0])
        
        runFastInsertTest(ManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runFastInsertTest(ManagedBufferHeap.self, element: TestElements.valueElements[0])
    }

    func testRemove() {
        runRemoveTest(ManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ManagedBufferHeap.self, element: TestElements.valueElements[0])
        
        runFastRemoveTest(ManagedBufferHeap.self, element: TestElements.referenceElements[0])
        runFastRemoveTest(ManagedBufferHeap.self, element: TestElements.valueElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(ManagedBufferHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ManagedBufferHeap.self, elements: TestElements.valueElements)
    }

    func testOrder() {
        runOrderTest(ManagedBufferHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ManagedBufferHeap.self, elements: TestElements.valueElements)
    }

    func testCoW() {
        runCoWTest(ManagedBufferHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ManagedBufferHeap.self, elements: TestElements.valueElements)
    }
}
