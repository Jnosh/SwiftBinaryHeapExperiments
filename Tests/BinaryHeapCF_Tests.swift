//
//  BinaryHeapCF_Tests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework


private func assertEmpty<Element>(heap: BinaryHeapCF<Element>) {
    XCTAssert(heap.count == 0, "Heap empty")
    XCTAssert(heap.first == nil, "Heap empty")
}

private func assertInvariants<Element>(var heap: BinaryHeapCF<Element>) {
    XCTAssertEqual(heap.count == 0, heap.isEmpty, "isEmpty iff (count == 0)")

    let count = heap.count
    let element = heap.popFirst()

    XCTAssert(heap.isEmpty || count == heap.count + 1, "Pop removes element")

    if let element = element {
        heap.insert(element)

        XCTAssert(heap.first != nil, "first == popFirst()")
        XCTAssert(element.compare(heap.first!) == .CompareEqualTo, "first == popFirst()")
    } else {
        XCTAssert(heap.first == nil, "first == popFirst()")
    }

    XCTAssert(heap.count == count, "Old count")
}

class BinaryHeapCF_Tests: XCTestCase {
    private var heap: BinaryHeapCF<RefElement>!

    override func setUp() {
        super.setUp()
        heap = BinaryHeapCF()
    }
    
    override func tearDown() {
        heap = nil
        super.tearDown()
    }

    private func insertElements() {
        for element in TestElements.referenceElements {
            heap.insert(element)
        }

        XCTAssert(heap.count == TestElements.elementCount, "Elements inserted")
    }



    // MARK: Tests

    func testInit() {
        assertEmpty(heap)
    }

    func testInsert() {
        let element = RefElement()
        heap.insert(element)

        XCTAssert(heap.count == 1, "Element inserted")
        XCTAssert(heap.first === element, "Element inserted")

        assertInvariants(heap)
    }

    func testRemove() {
        let element = RefElement()
        heap.insert(element)
        let root = heap.removeFirst()

        XCTAssert(element === root, "Element removed")
        assertEmpty(heap)
        assertInvariants(heap)
    }

    func testRemoveAll() {
        insertElements()
        assertInvariants(heap)

        // Remove
        heap.removeAll()

        assertEmpty(heap)
        assertInvariants(heap)
    }

    func testOrder() {
        let sortedElements = TestElements.referenceElements.sort()

        insertElements()
        assertInvariants(heap)

        // Remove
        var heapElements = [RefElement]()
        while !heap.isEmpty {
            heapElements.append(heap.removeFirst())
        }

        assertEmpty(heap)
        assertInvariants(heap)
        XCTAssert(sortedElements == heapElements, "Correct order")
    }

    func testCoW() {
        insertElements()
        assertInvariants(heap)

        // Copy
        var copy = heap

        // Remove
        var heapElements = [RefElement]()
        while !heap.isEmpty {
            heapElements.append(heap.removeFirst())
        }

        assertEmpty(heap)
        assertInvariants(heap)

        XCTAssert(heapElements.count == TestElements.elementCount, "Correct count")
        XCTAssert(copy.count == TestElements.elementCount, "Elements not removed")
        XCTAssert(copy.first != nil, "Elements not removed")
        assertInvariants(copy)

        var copyElements = [RefElement]()
        while !copy.isEmpty {
            copyElements.append(copy.removeFirst())
        }

        assertEmpty(copy)
        assertInvariants(copy)
        XCTAssert(heapElements == copyElements, "Same contents")
    }
}
