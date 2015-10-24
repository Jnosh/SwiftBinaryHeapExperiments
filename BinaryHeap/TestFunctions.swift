//
//  TestFunctions.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/02/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


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

    var name = String(BinaryHeapCF<E>.self)
    if let index = name.characters.indexOf("<") {
        name = String(name.characters.prefixUpTo(index))
    }

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

    var name = String(reflecting: Framework.BinaryHeapCF<E>.self)
    if let index = name.characters.indexOf("<") {
        name = String(name.characters.prefixUpTo(index))
    }

    for resultGroup in resultGroups {
        resultGroup[name].addMeasurement(insertTime, remove: removeTime)
    }
}




func timeHeap<Heap : BinaryHeapType, Element : Comparable where Heap.Element == Element>(resultGroup: ResultSetGroup, heapType: Heap.Type, elements: [Element]) {
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

    var name = String(heapType)
    if let index = name.characters.indexOf("<") {
        name = String(name.characters.prefixUpTo(index))
    }

    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeFrameworkHeap<Heap : Framework.BinaryHeapType, Element : Comparable where Heap.Element == Element>(resultGroup: ResultSetGroup, heapType: Heap.Type, elements: [Element]) {
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

    var name = String(reflecting: heapType)
    if let index = name.characters.indexOf("<") {
        name = String(name.characters.prefixUpTo(index))
    }

    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


