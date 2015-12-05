//
//  ArrayPointerHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ArrayPointerHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: Tests
    func testInsert() {
        runInsertTest(ArrayPointerHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ArrayPointerHeap.self, element: TestElements.valueElements[0])
        
        runFastInsertTest(ArrayPointerHeap.self, element: TestElements.referenceElements[0])
        runFastInsertTest(ArrayPointerHeap.self, element: TestElements.valueElements[0])
    }
    
    func testRemove() {
        runRemoveTest(ArrayPointerHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ArrayPointerHeap.self, element: TestElements.valueElements[0])
        
        runFastRemoveTest(ArrayPointerHeap.self, element: TestElements.referenceElements[0])
        runFastRemoveTest(ArrayPointerHeap.self, element: TestElements.valueElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(ArrayPointerHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ArrayPointerHeap.self, elements: TestElements.valueElements)
    }

    func testOrder() {
        runOrderTest(ArrayPointerHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ArrayPointerHeap.self, elements: TestElements.valueElements)
    }

    func testCoW() {
        runCoWTest(ArrayPointerHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ArrayPointerHeap.self, elements: TestElements.valueElements)
    }
}
