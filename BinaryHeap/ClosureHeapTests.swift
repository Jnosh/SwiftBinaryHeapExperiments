//
//  ClosureHeapTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


func timeClosureUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeClosureUnsafePointerHeap(measurements.refMeasurements, elements.refElements)
    timeClosureUnsafePointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureUnsafePointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureUnsafePointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureUnsafePointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureUnsafePointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureUnsafePointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureUnsafePointerHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureUnsafePointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClosureArrayBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureArrayBufferHeap(measurements.refMeasurements, elements.refElements)
    timeClosureArrayBufferHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureArrayBufferHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureArrayBufferHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureArrayBufferHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureArrayBufferHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureArrayBufferHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureArrayBufferHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureArrayBufferHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureArrayBufferHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureArrayBufferHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureArrayBufferHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureArrayBufferHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureArrayBufferHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
}

private func timeClosureUnsafePointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ClosureUnsafePointerHeap<Element>() { $0 < $1 }

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
    
    
    let name = "ClosureUnsafePointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeClosureArrayBufferHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = ClosureArrayBufferHeap<Element>() { $0 < $1 }

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


    let name = "ClosureArrayBufferHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureUnsafePointerHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = Framework.ClosureUnsafePointerHeap<Element>() { $0 < $1 }

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


    let name = "Framework.ClosureUnsafePointerHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureArrayBufferHeap<Element : Comparable>(resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = Framework.ClosureArrayBufferHeap<Element>() { $0 < $1 }

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


    let name = "Framework.ClosureArrayBufferHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
