//
//  UnsafePtrHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class UnsafePtrHeap_Tests: XCTestCase {

    private var refElementHeap: UnsafePtrHeap<RefElement>!
    private var valElementHeap: UnsafePtrHeap<ValElement>!

    override func setUp() {
        super.setUp()
        refElementHeap = UnsafePtrHeap()
        valElementHeap = UnsafePtrHeap()
    }

    override func tearDown() {
        refElementHeap = nil
        valElementHeap = nil
        super.tearDown()
    }


    // MARK: Tests

    func testInit() {
        runInitTest(refElementHeap)
        runInitTest(valElementHeap)
    }

    func testInsert() {
        runInsertTest(refElementHeap, element: TestElements.referenceElements[0])
        runInsertTest(valElementHeap, element: TestElements.valueElements[0])
    }

    func testRemove() {
        runRemoveTest(refElementHeap, element: TestElements.referenceElements[0])
        runRemoveTest(valElementHeap, element: TestElements.valueElements[0])
    }

    func testRemoveAll() {
        runRemoveAllTest(refElementHeap, elements: TestElements.referenceElements)
        runRemoveAllTest(valElementHeap, elements: TestElements.valueElements)
    }

    func testOrder() {
        runOrderTest(refElementHeap, elements: TestElements.referenceElements)
        runOrderTest(valElementHeap, elements: TestElements.valueElements)
    }

    func testCoW() {
        runCoWTest(refElementHeap, elements: TestElements.referenceElements)
        runCoWTest(valElementHeap, elements: TestElements.valueElements)
    }
}