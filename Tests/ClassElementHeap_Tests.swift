//
//  ClassElementHeap_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 23/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

class ClassElementHeap_Tests: XCTestCase {
    private var refElementHeap: ClassElementHeap<ReferenceElement>!
    
    override func setUp() {
        super.setUp()
        refElementHeap = ClassElementHeap()
    }
    
    override func tearDown() {
        refElementHeap = nil
        super.tearDown()
    }
    
    
    // MARK: Tests
    func testInit() {
        runInitTest(refElementHeap)
    }
    
    func testInsert() {
        runInsertTest(refElementHeap, element: TestElements.referenceElements[0])
    }
    
    func testRemove() {
        runRemoveTest(refElementHeap, element: TestElements.referenceElements[0])
    }
    
    func testRemoveAll() {
        runRemoveAllTest(refElementHeap, elements: TestElements.referenceElements)
    }
    
    func testOrder() {
        runOrderTest(refElementHeap, elements: TestElements.referenceElements)
    }
    
    func testCoW() {
        //runCoWTest(refElementHeap, elements: TestElements.referenceElements)
    }
}
