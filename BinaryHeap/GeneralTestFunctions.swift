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
    if let index = find(name, "<") {
        return name.substringToIndex(index)
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

    let name = removeGenerics(String(stringInterpolationSegment: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeHeapTransparent<Heap : BinaryHeapType, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
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

    let name = removeGenerics(String(stringInterpolationSegment: heapType)) + " (@transparent)"
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
    
    let name = removeGenerics(String(stringInterpolationSegment: heapType)) + " (workaround)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeHeapFastTransparent<Heap : BinaryHeapType_Fast, Element where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
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
    
    let name = removeGenerics(String(stringInterpolationSegment: heapType)) + " (@transparent + workaround)"
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

    let name = removeGenerics(String(stringInterpolationSegment: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

