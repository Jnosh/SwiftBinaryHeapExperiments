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
    private var heap: CFBinaryHeapWrapper<ReferenceElement>!

    override func setUp() {
        super.setUp()
        heap = CFBinaryHeapWrapper()
    }
    
    override func tearDown() {
        heap = nil
        super.tearDown()
    }

    // MARK: Tests
    func testInit() {
        runInitTest(heap)
    }

    func testInsert() {
        runInsertTest(heap, element: TestElements.referenceElements[0])
    }

    func testRemove() {
        runRemoveTest(heap, element: TestElements.referenceElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(heap, elements: TestElements.referenceElements)
    }

    func testOrder() {
        runOrderTest(heap, elements: TestElements.referenceElements)
    }

    func testCoW() {
        runCoWTest(heap, elements: TestElements.referenceElements)
    }
}
