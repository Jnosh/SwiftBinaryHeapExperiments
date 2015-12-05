//
//  ArrayHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ArrayHeap_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }


    // MARK: Tests

    func testInsert() {
        runInsertTest(ArrayHeap.self, element: TestElements.referenceElements[0])
        runInsertTest(ArrayHeap.self, element: TestElements.valueElements[0])
    }

    func testRemove() {
        runRemoveTest(ArrayHeap.self, element: TestElements.referenceElements[0])
        runRemoveTest(ArrayHeap.self, element: TestElements.valueElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(ArrayHeap.self, elements: TestElements.referenceElements)
        runRemoveAllTest(ArrayHeap.self, elements: TestElements.valueElements)
    }

    func testOrder() {
        runOrderTest(ArrayHeap.self, elements: TestElements.referenceElements)
        runOrderTest(ArrayHeap.self, elements: TestElements.valueElements)
    }

    func testCoW() {
        runCoWTest(ArrayHeap.self, elements: TestElements.referenceElements)
        runCoWTest(ArrayHeap.self, elements: TestElements.valueElements)
    }
}
