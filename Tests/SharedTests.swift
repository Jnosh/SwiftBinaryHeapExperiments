//
//  SharedTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework


func assertEmpty<Heap: _BinaryHeapType>(heap: Heap) {
    XCTAssert(heap.count == 0, "Heap empty")
    XCTAssert(heap.first == nil, "Heap empty")
}

func assertInvariants<Heap: _BinaryHeapType where Heap.Element : Comparable>(inout heap: Heap) {
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

func insertElements<Heap: _BinaryHeapType>(inout heap: Heap, elements: [Heap.Element]) {
    for element in elements {
        heap.insert(element)
    }

    XCTAssert(heap.count == TestElements.elementCount, "Elements inserted")
}

// MARK: Tests

func runInitTest<Heap: BinaryHeapType>(heapType: Heap.Type) -> Heap {
    let heap = heapType.init()
    assertEmpty(heap)
    return heap
}

func runInsertTest<Heap: BinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.insert(element)

    XCTAssert(heap.count == 1, "Element inserted")
    XCTAssert(heap.first == element, "Element inserted")

    assertInvariants(&heap)
}

func runFastInsertTest<Heap: BinaryHeapType_Fast where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.fastInsert(element)
    
    XCTAssert(heap.count == 1, "Element inserted")
    XCTAssert(heap.first == element, "Element inserted")
    
    assertInvariants(&heap)
}

func runRemoveTest<Heap: BinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.insert(element)
    let root = heap.removeFirst()

    XCTAssert(element == root, "Element removed")
    assertEmpty(heap)
    assertInvariants(&heap)
}

func runFastRemoveTest<Heap: BinaryHeapType_Fast where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.fastInsert(element)
    let root = heap.fastRemoveFirst()
    
    XCTAssert(element == root, "Element removed")
    assertEmpty(heap)
    assertInvariants(&heap)
}

func runRemoveAllTest<Heap: BinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, elements: [Heap.Element]) {
    var heap = runInitTest(heapType)
    insertElements(&heap, elements: elements)
    assertInvariants(&heap)

    // Remove
    heap.removeAll(keepCapacity: false)

    assertEmpty(heap)
    assertInvariants(&heap)
}

func runOrderTest<Heap: BinaryHeapType, Element : Comparable where Element == Heap.Element>(heapType: Heap.Type, elements: [Element]) {
    let sortedElements = elements.sort()

    var heap = runInitTest(heapType)
    insertElements(&heap, elements: elements)
    assertInvariants(&heap)

    // Remove
    var heapElements = [Element]()
    while !heap.isEmpty {
        heapElements.append(heap.removeFirst())
    }

    assertEmpty(heap)
    assertInvariants(&heap)
    XCTAssert(sortedElements == heapElements, "Correct order")
}

func runCoWTest<Heap: BinaryHeapType, Element : Comparable where Element == Heap.Element>(heapType: Heap.Type, elements: [Element]) {
    var heap = runInitTest(heapType)
    insertElements(&heap, elements: elements)
    assertInvariants(&heap)

    // Copy
    var copy = heap

    // Remove
    var heapElements = [Element]()
    while !heap.isEmpty {
        heapElements.append(heap.removeFirst())
    }

    // TODO: Should also test that other mutating funcs work with CoW (insert, removeAll, popFirst, ...)

    assertEmpty(heap)
    assertInvariants(&heap)

    XCTAssert(heapElements.count == elements.count, "Correct count")
    XCTAssert(copy.count == elements.count, "Elements not removed")
    XCTAssert(copy.first != nil, "Elements not removed")
    assertInvariants(&copy)

    var copyElements = [Element]()
    while !copy.isEmpty {
        copyElements.append(copy.removeFirst())
    }
    
    assertEmpty(copy)
    assertInvariants(&copy)
    XCTAssert(heapElements == copyElements, "Same contents")
}

/*
func runReserveCapacityTest<Heap: BinaryHeapType>(heapType: Heap.Type) {
    var heap = runInitTest(heapType)
    heap.reserveCapacity(TestValues.capacity)
    XCTAssert(heap.capacity >= TestValues.capacity, "Heap has capacity")

    assertEmpty(heap)
    assertInvariants(heap)
}
*/
