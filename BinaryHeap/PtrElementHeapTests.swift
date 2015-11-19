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
    timePtrElementHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timePtrElementHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timePtrElementHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timePtrElementHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timePtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timePtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timePtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework
    timeFrameworkPtrElementHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}


private func timePtrElementHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
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

private func timeFrameworkPtrElementHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
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
