//
//  SharedTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework


private func assertEmpty<Heap: BinaryHeapType>(heap: Heap) {
    XCTAssert(heap.count == 0, "Heap empty")
    XCTAssert(heap.first == nil, "Heap empty")
}

private func assertInvariants<Heap: BinaryHeapType>(var heap: Heap) {
    XCTAssertEqual(heap.count == 0, heap.isEmpty, "isEmpty iff (count == 0)")

    let count = heap.count
    let element = heap.popFirst()

    XCTAssert(heap.isEmpty || count == heap.count + 1, "Pop removes element")

    if let element = element {
        heap.insert(element)
    }

    XCTAssert(heap.count == count, "Old count")
    XCTAssert(element == heap.first, "first == element")
}

private func insertElements<Heap: BinaryHeapType>(inout heap: Heap, elements: [Heap.Element]) {
    for element in elements {
        heap.insert(element)
    }

    XCTAssert(heap.count == TestElements.elementCount, "Elements inserted")
}

// MARK: Tests


func runInitTest<Heap: BinaryHeapType>(heap: Heap) {
    assertEmpty(heap)
}

func runInsertTest<Heap: BinaryHeapType>(var heap: Heap, element: Heap.Element) {
    heap.insert(element)

    XCTAssert(heap.count == 1, "Element inserted")
    XCTAssert(heap.first == element, "Element inserted")

    assertInvariants(heap)
}

func runRemoveTest<Heap: BinaryHeapType>(var heap: Heap, element: Heap.Element) {
    heap.insert(element)
    let root = heap.removeFirst()

    XCTAssert(element == root, "Element removed")
    assertEmpty(heap)
    assertInvariants(heap)
}

func runRemoveAllTest<Heap: BinaryHeapType>(var heap: Heap, elements: [Heap.Element]) {
    insertElements(&heap, elements: elements)
    assertInvariants(heap)

    // Remove
    heap.removeAll(keepCapacity: false)

    assertEmpty(heap)
    assertInvariants(heap)
}

func runOrderTest<Heap: BinaryHeapType, Element where Element == Heap.Element>(var heap: Heap, elements: [Element]) {
    let sortedElements = elements.sort()

    insertElements(&heap, elements: elements)
    assertInvariants(heap)

    // Remove
    var heapElements = [Element]()
    while !heap.isEmpty {
        heapElements.append(heap.removeFirst())
    }

    assertEmpty(heap)
    assertInvariants(heap)
    XCTAssert(sortedElements == heapElements, "Correct order")
}

func runCoWTest<Heap: BinaryHeapType, Element where Element == Heap.Element>(var heap: Heap, elements: [Element]) {
    insertElements(&heap, elements: elements)
    assertInvariants(heap)

    // Copy
    var copy = heap

    // Remove
    var heapElements = [Element]()
    while !heap.isEmpty {
        heapElements.append(heap.removeFirst())
    }

    // TODO: Should also test that other mutating funcs work with CoW (insert, removeAll, popFirst, ...)

    assertEmpty(heap)
    assertInvariants(heap)

    XCTAssert(heapElements.count == elements.count, "Correct count")
    XCTAssert(copy.count == elements.count, "Elements not removed")
    XCTAssert(copy.first != nil, "Elements not removed")
    assertInvariants(copy)

    var copyElements = [Element]()
    while !copy.isEmpty {
        copyElements.append(copy.removeFirst())
    }
    
    assertEmpty(copy)
    assertInvariants(copy)
    XCTAssert(heapElements == copyElements, "Same contents")
}


/*
func testReserveCapacity() {
    heap.reserveCapacity(TestValues.capacity)
    XCTAssert(heap.capacity >= TestValues.capacity, "Heap has capacity")

    XCTAssert(heap.count == 0, "Heap empty")
    XCTAssert(heap.isEmpty, "Heap empty")
    XCTAssert(heap.root == nil, "Heap empty")
    XCTAssert(heap.array.count == 0, "Heap empty")
    // XCTAssert(heap.reverseSortedArray.count == 0, "Heap empty")
}

func testInitFromCollection() {
    heap = ArrayHeap(elements: TestValues.referenceNodes, isOrderedBefore: <)

    XCTAssert(heap.count == TestValues.nodeCount, "Nodes inserted")
    XCTAssert(!heap.isEmpty, "Nodes inserted")

    // Remove
    var heapNodes = [ReferenceNode]()
    while !heap.isEmpty {
        heapNodes.append(heap.removeRoot())
    }

    XCTAssert(heap.count == 0, "Nodes removed")
    XCTAssert(heap.isEmpty, "Nodes removed")
    XCTAssert(heap.root == nil, "Nodes removed")

    XCTAssert(heapNodes.count == TestValues.nodeCount, "Correct count")
    XCTAssert(heapNodes == TestValues.sortedReferenceNodes, "Correct order")
}

func testInitFromSequence() {
    let sequence = AnySequence(TestValues.referenceNodes)
    heap = ArrayHeap(elements: sequence, isOrderedBefore: <)

    XCTAssert(heap.count == TestValues.nodeCount, "Nodes inserted")
    XCTAssert(!heap.isEmpty, "Nodes inserted")

    // Remove
    var heapNodes = [ReferenceNode]()
    while !heap.isEmpty {
        heapNodes.append(heap.removeRoot())
    }

    XCTAssert(heap.count == 0, "Nodes removed")
    XCTAssert(heap.isEmpty, "Nodes removed")
    XCTAssert(heap.root == nil, "Nodes removed")

    XCTAssert(heapNodes.count == TestValues.nodeCount, "Correct count")
    XCTAssert(heapNodes == TestValues.sortedReferenceNodes, "Correct order")
}
*/





