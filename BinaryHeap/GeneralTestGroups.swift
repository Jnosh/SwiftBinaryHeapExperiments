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
    timeHeap(ArrayHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(ArrayHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeap(ArrayHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeap(ArrayHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeap(ArrayHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeap(ArrayHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeap(ArrayHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayHeap.self, measurements.refMeasurements, elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(ArrayPointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeap(ArrayPointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeap(ArrayPointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeap(ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeap(ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeap(ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Run test on "fast" variant
    timeHeapFast(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFastTransparent(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(UnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(UnsafePointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeap(UnsafePointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeap(UnsafePointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeap(UnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeap(UnsafePointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeap(UnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeHeap(ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(ManagedBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeap(ManagedBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeap(ManagedBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeap(ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeap(ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeap(ManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // "fast" variant
    timeHeapFast(ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClassElementHeap(elements: ElementContainer) {
    // Local
    timeHeap(ClassElementHeap.self, measurements.refMeasurements, elements.refElements)
    
    // Framework
    timeFrameworkHeap(Framework.ClassElementHeap.self, measurements.refMeasurements, elements.refElements)
}

func timeNonCoWHeap(elements: ElementContainer) {
    // Local
    timeHeap(NonCoWHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(NonCoWHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeHeap(NonCoWHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeHeap(NonCoWHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeHeap(NonCoWHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeHeap(NonCoWHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeHeap(NonCoWHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

