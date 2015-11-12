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
let iterations = 10

// Measurements
let measurements = MeasurementContainer()

// Collect data
for _ in 0..<iterations {
    // Create fresh elements
    // Since element values have impact on performance use different values for each iteration
    // to get a better average at the cost of increased variance
    let elementContainer = ElementContainer(count: elementCount)

    // Time CFBinaryHeapWrapper
    timeCFHeap(resultGroup: measurements.refMeasurements, elements: elementContainer.refElements)
    timeFrameworkCFHeap(resultGroup: measurements.refMeasurements, elements: elementContainer.refElements)

    // Time standard variants
    timeArrayHeap(elementContainer)
    timeArrayPointerHeap(elementContainer)
    timeUnsafePointerHeap(elementContainer)
    timeManagedBufferHeap(elementContainer)

    // Time ClosureHeap
    timeClosureHeap(elementContainer)

    // Time PtrElementHeap
    timePtrElementHeap(elementContainer)

    // Time ClassElementHeap
    timeHeap(ClassElementHeap.self, resultGroup: measurements.refMeasurements, elements: elementContainer.refElements)
    timeFrameworkHeap(Framework.ClassElementHeap.self, resultGroup: measurements.refMeasurements, elements: elementContainer.refElements)
}

// Print the collected results
for measurementGroup in measurements.allMeasurements {
    printMeasurementGroup(measurementGroup)
}




