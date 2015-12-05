//
//  CFBinaryHeapTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


func timeCFHeapWrapper(elements: ElementContainer) {
    // Local
    timeCFHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(CFBinaryHeapWrapper.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    
    // Framework
    timeFrameworkCFHeap(resultGroup: measurements.refMeasurements, elements: elements.frameworkReferenceElements)
    timeFrameworkHeap(Framework.CFBinaryHeapWrapper.self, resultGroup: measurements.refMeasurements, elements: elements.frameworkReferenceElements)
}

private func timeCFHeap<E: CFComparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    var heap = CFBinaryHeapWrapper<E>()
    
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
    
    let name = removeGenerics(String(CFBinaryHeapWrapper<E>.self)) + " (non-generic test)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkCFHeap<E: Framework.CFComparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    var heap = Framework.CFBinaryHeapWrapper<E>()
    
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
    
    let name = removeGenerics(String(reflecting: Framework.CFBinaryHeapWrapper<E>.self))  + " (non-generic test)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
