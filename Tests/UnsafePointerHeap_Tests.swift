//
//  UnsafePointerHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class UnsafePointerHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: Tests
    func testInsert() {
        runInsertTest(UnsafePointerHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(UnsafePointerHeap.self, element: TestElements.valueElements[0])
    }

    func testRemove() {
        runRemoveTest(UnsafePointerHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(UnsafePointerHeap.self, element: TestElements.valueElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(UnsafePointerHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(UnsafePointerHeap.self, elements: TestElements.valueElements)
    }

    func testOrder() {
        runOrderTest(UnsafePointerHeap.self, elements: TestElements.referenceElements)
        runOrderTest(UnsafePointerHeap.self, elements: TestElements.valueElements)
    }

    func testCoW() {
        runCoWTest(UnsafePointerHeap.self, elements: TestElements.referenceElements)
        runCoWTest(UnsafePointerHeap.self, elements: TestElements.valueElements)
    }
}
