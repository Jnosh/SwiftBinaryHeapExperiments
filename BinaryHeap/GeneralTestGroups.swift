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
    timeArrayHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeArrayHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeArrayHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeArrayHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeArrayHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeArrayHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkArrayHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkArrayHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkArrayHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkArrayHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkArrayHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkArrayHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkArrayHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeArrayHeapTransparent(measurements.refMeasurements, elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeArrayPointerHeap(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeArrayPointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeArrayPointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeArrayPointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeArrayPointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeArrayPointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkArrayPointerHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkArrayPointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkArrayPointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkArrayPointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkArrayPointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkArrayPointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkArrayPointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Run test on "fast" variant
    timeArrayPointerHeapFast(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeapFast(measurements.smallValueMeasurements, elements.smallValueElements)
    timeArrayPointerHeapFast(measurements.medValueMeasurements, elements.mediumValueElements)
    timeArrayPointerHeapFast(measurements.largeValueMeasurements, elements.largeValueElements)
    timeArrayPointerHeapFast(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeArrayPointerHeapFast(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeArrayPointerHeapFast(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeArrayPointerHeapTransparent(measurements.refMeasurements, elements.refElements)
    timeArrayPointerHeapFastTransparent(measurements.refMeasurements, elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeUnsafePointerHeap(measurements.refMeasurements, elements.refElements)
    timeUnsafePointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeUnsafePointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeUnsafePointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeUnsafePointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeUnsafePointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeUnsafePointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkUnsafePointerHeap(measurements.refMeasurements, elements.refElements)
    timeFrameworkUnsafePointerHeap(measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkUnsafePointerHeap(measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkUnsafePointerHeap(measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkUnsafePointerHeap(measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkUnsafePointerHeap(measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkUnsafePointerHeap(measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeUnsafePointerHeapTransparent(measurements.refMeasurements, elements.refElements)
}

func timeClassElementHeap(elements: ElementContainer) {
    // Local
    timeClassElementHeap(measurements.refMeasurements, elements.refElements)

    // Framework
    timeFrameworkClassElementHeap(measurements.refMeasurements, elements.refElements)
}

