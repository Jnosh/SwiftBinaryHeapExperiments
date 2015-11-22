//
//  TestGroups.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Framework


func timeArrayHeap(elements: ElementContainer) {
    // Local
    timeArrayHeap(measurements.refMeasurements, elements.refElements)
    timeArrayHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeArrayHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeArrayHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeArrayHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeArrayHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeArrayHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkArrayHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkArrayHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkArrayHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkArrayHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkArrayHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkArrayHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkArrayHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeArrayHeapTransparent(measurements.refMeasurements, elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeArrayPointerHeap(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeArrayPointerHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeArrayPointerHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeArrayPointerHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeArrayPointerHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeArrayPointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkArrayPointerHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkArrayPointerHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkArrayPointerHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkArrayPointerHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkArrayPointerHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkArrayPointerHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkArrayPointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Run test on "fast" variant
    timeArrayPointerHeapFast(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeapFast(measurements.smallValMeasurements, elements.smallValElements)
    timeArrayPointerHeapFast(measurements.medValMeasurements, elements.mediumValElements)
    timeArrayPointerHeapFast(measurements.largeValMeasurements, elements.largeValElements)
    timeArrayPointerHeapFast(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeArrayPointerHeapFast(measurements.ptrValMeasurements, elements.ptrValElements)
    timeArrayPointerHeapFast(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeArrayPointerHeapTransparent(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeapFastTransparent(measurements.refMeasurements, elements.refElements)
}

func timeNonCoWHeap(elements: ElementContainer) {
    // Local
    timeNonCoWHeap(measurements.refMeasurements, elements.refElements)
    timeNonCoWHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeNonCoWHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeNonCoWHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeNonCoWHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeNonCoWHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeNonCoWHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkNonCoWHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkNonCoWHeap(measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkNonCoWHeap(measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkNonCoWHeap(measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkNonCoWHeap(measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkNonCoWHeap(measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkNonCoWHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)
}

