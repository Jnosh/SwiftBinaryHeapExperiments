//
//  PtrElementHeapTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


func timePtrElementHeap(elements: ElementContainer) {
    // Local
    timePtrElementHeap(resultGroup: measurements.refMeasurements, elements.refElements)
    timePtrElementHeap(resultGroup: measurements.smallValMeasurements, elements.smallValElements)
    timePtrElementHeap(resultGroup: measurements.medValMeasurements, elements.mediumValElements)
    timePtrElementHeap(resultGroup: measurements.largeValMeasurements, elements.largeValElements)
    timePtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements.ptrRefElements)
    timePtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements.ptrValElements)
    timePtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkPtrElementHeap(resultGroup: measurements.refMeasurements, elements.refElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements)
}


private func timePtrElementHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    let elementPtr = UnsafeMutablePointer<E>.alloc(elements.count)
    elementPtr.initializeFrom(elements)

    var heap = PtrElementHeap<E>()
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in stride(from: elementPtr, to: elementPtr.advancedBy(elements.count), by: 1) {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    let name = "PtrElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)

    elementPtr.destroy(elements.count)
    elementPtr.dealloc(elements.count)
}

private func timeFrameworkPtrElementHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    let elementPtr = UnsafeMutablePointer<E>.alloc(elements.count)
    elementPtr.initializeFrom(elements)
    
    var heap = Framework.PtrElementHeap<E>()
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in stride(from: elementPtr, to: elementPtr.advancedBy(elements.count), by: 1) {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()
    
    
    let name = "Framework.PtrElementHeap"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)

    elementPtr.destroy(elements.count)
    elementPtr.dealloc(elements.count)
}
