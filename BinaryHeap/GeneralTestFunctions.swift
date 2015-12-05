//
//  TestFunctions.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/02/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework

func timeArrayHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayHeap<Element>()

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

    let name = "ArrayHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeArrayPointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayPointerHeap<Element>()

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

    let name = "ArrayPointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeArrayHeapTransparent<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayHeap<Element>()

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

    let name = "ArrayHeap" + " (@transparent)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeArrayPointerHeapTransparent<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayPointerHeap<Element>()

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

    let name = "ArrayPointerHeap" + " (@transparent)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeArrayPointerHeapFast<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayPointerHeap<Element>()

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

    let name = "ArrayPointerHeap" + " (workaround)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeArrayPointerHeapFastTransparent<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ArrayPointerHeap<Element>()

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
    
    let name = "ArrayPointerHeap" + " (@transparent + workaround)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeFrameworkArrayHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = Framework.ArrayHeap<Element>()

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

    let name = "Framework.ArrayHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkArrayPointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = Framework.ArrayPointerHeap<Element>()

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

    let name = "Framework.ArrayPointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeUnsafePointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = UnsafePointerHeap<Element>()

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

    let name = "UnsafePointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

@transparent func timeUnsafePointerHeapTransparent<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = UnsafePointerHeap<Element>()

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

    let name = "UnsafePointerHeap" + " (@transparent)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkUnsafePointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = Framework.UnsafePointerHeap<Element>()

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

    let name = "Framework.UnsafePointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timeClassElementHeap(resultGroup: MeasurementGroup, elements: [ReferenceElement]) {
    var heap = ClassElementHeap<ReferenceElement>()

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

    let name = "ClassElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkClassElementHeap(resultGroup: MeasurementGroup, elements: [ReferenceElement]) {
    var heap = Framework.ClassElementHeap<ReferenceElement>()

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

    let name = "Framework.ClassElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}



