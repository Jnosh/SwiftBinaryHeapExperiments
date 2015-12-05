//
//  ClosureHeapTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/12/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import XCTest
import Framework

// FIXME: Ideally we would just reuse the standard shared tests
// But we currently can't do that as we can't conform the closure heaps to BinaryHeapType
// For now we duplicate the tests. Alternatively could initialize the arrays outside the tests
// but that would require a lot of boilerplate initialization code + passing the heaps as
// inout args to have them uniquely referenced.

// MARK: Tests

func runInitTest<Heap: ClosureBinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type) -> Heap {
    let heap = heapType.init()
    assertEmpty(heap)
    return heap
}

func runInsertTest<Heap: ClosureBinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.insert(element)

    XCTAssert(heap.count == 1, "Element inserted")
    XCTAssert(heap.first == element, "Element inserted")

    assertInvariants(&heap)
}

func runRemoveTest<Heap: ClosureBinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, element: Heap.Element) {
    var heap = runInitTest(heapType)
    heap.insert(element)
    let root = heap.removeFirst()

    XCTAssert(element == root, "Element removed")
    assertEmpty(heap)
    assertInvariants(&heap)
}

func runRemoveAllTest<Heap: ClosureBinaryHeapType where Heap.Element : Comparable>(heapType: Heap.Type, elements: [Heap.Element]) {
    var heap = runInitTest(heapType)
    insertElements(&heap, elements: elements)
    assertInvariants(&heap)

    // Remove
    heap.removeAll(keepCapacity: false)

    assertEmpty(heap)
    assertInvariants(&heap)
}

func runOrderTest<Heap: ClosureBinaryHeapType, Element : Comparable where Element == Heap.Element>(heapType: Heap.Type, elements: [Element]) {
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

func runCoWTest<Heap: ClosureBinaryHeapType, Element : Comparable where Element == Heap.Element>(heapType: Heap.Type, elements: [Element]) {
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

