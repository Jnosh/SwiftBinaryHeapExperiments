//
//  TestFunctions.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/02/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework

func removeGenerics(name: String) -> String {
    if let index = name.characters.indexOf("<") {
        return String(name.characters.prefixUpTo(index))
    }

    return name
}

func timeCFHeap<E: CFComparable>(resultGroups: [ResultSetGroup], elements: [E]) {
    var heap = BinaryHeapCF<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = removeGenerics(String(BinaryHeapCF<E>.self))
    for resultGroup in resultGroups {
        resultGroup[name].addMeasurement(insertTime, remove: removeTime)
    }
}

func timeFrameworkCFHeap<E: Framework.CFComparable>(resultGroups: [ResultSetGroup], elements: [E]) {
    var heap = Framework.BinaryHeapCF<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while heap.count != 0 {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = removeGenerics(String(reflecting: Framework.BinaryHeapCF<E>.self))
    for resultGroup in resultGroups {
        resultGroup[name].addMeasurement(insertTime, remove: removeTime)
    }
}

func timePtrElementHeap<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    let elementPtr = UnsafeMutablePointer<E>.alloc(elements.count)
    elementPtr.initializeFrom(elements)
    defer {
        elementPtr.destroy(elements.count)
        elementPtr.dealloc(elements.count)
    }

    var heap = PtrElementHeap<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elementPtr.stride(to: elementPtr.advancedBy(elements.count), by: 1) {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(PtrElementHeap<E>.self))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkPtrElementHeap<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    let elementPtr = UnsafeMutablePointer<E>.alloc(elements.count)
    elementPtr.initializeFrom(elements)
    defer {
        elementPtr.destroy(elements.count)
        elementPtr.dealloc(elements.count)
    }

    var heap = Framework.PtrElementHeap<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elementPtr.stride(to: elementPtr.advancedBy(elements.count), by: 1) {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(reflecting: Framework.PtrElementHeap<E>.self))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeClosureHeap<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    var heap = ClosureHeap<E>(isOrderedBefore: <)

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(ClosureHeap<E>.self)) + " (local <)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkClosureHeap<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    var heap = Framework.ClosureHeap<E>(isOrderedBefore: <)
    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(reflecting: Framework.ClosureHeap<E>.self)) + " (local <)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeClosureHeapLocalLiteral<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    var heap = ClosureHeap<E>() { $0 < $1 }

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(ClosureHeap<E>.self)) + " (local literal)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkClosureHeapLocalLiteral<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E]) {
    var heap = Framework.ClosureHeap<E>() { $0 < $1 }

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(reflecting: Framework.ClosureHeap<E>.self)) + " (local literal)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeClosureHeapArg<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E], name variantName: String, isOrderedBefore: (E, E) -> Bool) {
    var heap = ClosureHeap<E>(isOrderedBefore: isOrderedBefore)

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(ClosureHeap<E>.self)) + " " + variantName
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkClosureHeapArg<E: Comparable>(resultGroup resultGroup: ResultSetGroup, elements: [E], name variantName: String, isOrderedBefore: (E, E) -> Bool) {
    var heap = Framework.ClosureHeap<E>(isOrderedBefore: isOrderedBefore)

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()


    let name = removeGenerics(String(reflecting: Framework.ClosureHeap<E>.self)) + " " + variantName
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeHeap<Heap : BinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, resultGroup: ResultSetGroup, elements: [Element]) {
    var heap = heapType.init()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = removeGenerics(String(heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeHeapTransparent<Heap : BinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, resultGroup: ResultSetGroup, elements: [Element]) {
    var heap = heapType.init()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = removeGenerics(String(heapType)) + " (@transparent)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkHeap<Heap : Framework.BinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, resultGroup: ResultSetGroup, elements: [Element]) {
    var heap = heapType.init()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
    heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
    heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = removeGenerics(String(reflecting: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


