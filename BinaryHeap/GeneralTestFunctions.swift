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

func timeHeap<Heap : BinaryHeapType, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
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

@_transparent func timeHeapTransparent<Heap : BinaryHeapType, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
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

func timeHeapFast<Heap : BinaryHeapType_Fast, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = heapType.init()
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.fastInsert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.fastRemoveFirst()
    }
    let removeTime = sw2.elapsed()
    
    let name = removeGenerics(String(heapType)) + " (workaround)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@_transparent func timeHeapFastTransparent<Heap : BinaryHeapType_Fast, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = heapType.init()
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.fastInsert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.fastRemoveFirst()
    }
    let removeTime = sw2.elapsed()
    
    let name = removeGenerics(String(heapType)) + " (@transparent + workaround)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeFrameworkHeap<Heap : Framework.BinaryHeapType, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
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

