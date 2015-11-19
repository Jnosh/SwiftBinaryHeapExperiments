//
//  main.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Framework

// Constants
let elementCount = 10000
let iterations = 20

// Measurements
let measurements = MeasurementContainer()

// Collect data
for _ in 0..<iterations {
    // Create fresh elements
    // Since element values have impact on performance use different values for each iteration
    // to get a better average at the cost of increased variance
    let elementContainer = ElementContainer(count: elementCount)

    // Time CFBinaryHeapWrapper
    timeCFHeapWrapper(elementContainer)

    // Time standard variants
    timeArrayHeap(elementContainer)
    timeArrayPointerHeap(elementContainer)
    timeUnsafePointerHeap(elementContainer)
    timeManagedBufferHeap(elementContainer)

    // Time closure-based heaps
    timeClosureUnsafePointerHeapNonGeneric(elementContainer)
    // timeClosureUnsafePointerHeap(elementContainer)
    timeClosureManagedBufferHeap(elementContainer)
    timeClosureArrayBufferHeap(elementContainer)

    // Time PtrElementHeap
    timePtrElementHeap(elementContainer)

    // Time ClassElementHeap
    timeClassElementHeap(elementContainer)
}

// Print the collected results
for measurementGroup in measurements.allMeasurements {
    printMeasurementGroup(measurementGroup)
}




