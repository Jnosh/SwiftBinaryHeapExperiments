
//
//  TestNonGenericHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 22/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework

func timeNonGenericHeaps(elements: ElementContainer) {
    // Local
    timeReferenceElementHeap(measurements.refMeasurements, elements.refElements)
    timeSmallValueElementHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeMediumValueElementHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeLargeValueElementHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timePointerReferenceElementHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timePointerValueElementHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeUnmanagedElementHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework    
    timeFrameworkReferenceElementHeap(measurements.refMeasurements, elements.frameworkReferenceElements)
    timeFrameworkSmallValueElementHeap(measurements.smallValueMeasurements, elements.frameworkSmallValueElements)
    timeFrameworkMediumValueElementHeap(measurements.medValueMeasurements, elements.frameworkMediumValueElements)
    timeFrameworkLargeValueElementHeap(measurements.largeValueMeasurements, elements.frameworkLargeValueElements)
    timeFrameworkPointerReferenceElementHeap(measurements.ptrRefMeasurements, elements.frameworkPointerReferenceElements)
    timeFrameworkPointerValueElementHeap(measurements.ptrValMeasurements, elements.frameworkPointerValueElements)
    timeFrameworkUnmanagedElementHeap(measurements.unmanagedMeasurements, elements.frameworkUnmanagedElements)
}

func timeReferenceElementHeap(resultGroup: MeasurementGroup, elements: [ReferenceElement]) {
    var heap = ReferenceElementHeap()

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

    let name = "ReferenceElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkReferenceElementHeap(resultGroup: MeasurementGroup, elements: [Framework.ReferenceElement]) {
    var heap = Framework.ReferenceElementHeap()

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

    let name = "Framework.ReferenceElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeSmallValueElementHeap(resultGroup: MeasurementGroup, elements: [ValueElementSmall]) {
    var heap = SmallValueElementHeap()

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

    let name = "SmallValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkSmallValueElementHeap(resultGroup: MeasurementGroup, elements: [Framework.ValueElementSmall]) {
    var heap = Framework.SmallValueElementHeap()

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

    let name = "Framework.SmallValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeMediumValueElementHeap(resultGroup: MeasurementGroup, elements: [ValueElementMedium]) {
    var heap = MediumValueElementHeap()

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

    let name = "MediumValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkMediumValueElementHeap(resultGroup: MeasurementGroup, elements: [Framework.ValueElementMedium]) {
    var heap = Framework.MediumValueElementHeap()

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

    let name = "Framework.MediumValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeLargeValueElementHeap(resultGroup: MeasurementGroup, elements: [ValueElementLarge]) {
    var heap = LargeValueElementHeap()

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

    let name = "LargeValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkLargeValueElementHeap(resultGroup: MeasurementGroup, elements: [Framework.ValueElementLarge]) {
    var heap = Framework.LargeValueElementHeap()

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

    let name = "Framework.LargeValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timePointerReferenceElementHeap(resultGroup: MeasurementGroup, elements: [PointerElement<ReferenceElement>]) {
    var heap = PointerReferenceElementHeap()

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

    let name = "PointerReferenceElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkPointerReferenceElementHeap(resultGroup: MeasurementGroup, elements: [Framework.PointerElement<Framework.ReferenceElement>]) {
    var heap = Framework.PointerReferenceElementHeap()

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

    let name = "Framework.PointerReferenceElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


func timePointerValueElementHeap(resultGroup: MeasurementGroup, elements: [PointerElement<ValueElementLarge>]) {
    var heap = PointerValueElementHeap()

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

    let name = "PointerValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkPointerValueElementHeap(resultGroup: MeasurementGroup, elements: [Framework.PointerElement<Framework.ValueElementLarge>]) {
    var heap = Framework.PointerValueElementHeap()

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

    let name = "Framework.PointerValueElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}



func timeUnmanagedElementHeap(resultGroup: MeasurementGroup, elements: [UnmanagedElement<ReferenceElement>]) {
    var heap = UnmanagedElementHeap()

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

    let name = "UnmanagedElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

func timeFrameworkUnmanagedElementHeap(resultGroup: MeasurementGroup, elements: [Framework.UnmanagedElement<Framework.ReferenceElement>]) {
    var heap = Framework.UnmanagedElementHeap()

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

    let name = "Framework.UnmanagedElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

