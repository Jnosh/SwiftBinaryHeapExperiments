//
//  CFBinaryHeapWrapper_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework


class CFBinaryHeapWrapper_Tests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    // MARK: Tests
    func testInsert() {
        runInsertTest(CFBinaryHeapWrapper.self, element: TestElements.referenceElements[0])
    }

    func testRemove() {
        runRemoveTest(CFBinaryHeapWrapper.self, element: TestElements.referenceElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(CFBinaryHeapWrapper.self, elements: TestElements.referenceElements)
    }

    func testOrder() {
        runOrderTest(CFBinaryHeapWrapper.self, elements: TestElements.referenceElements)
    }

    func testCoW() {
        runCoWTest(CFBinaryHeapWrapper.self, elements: TestElements.referenceElements)
    }
}
