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
    timeHeap(ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Run test on "fast" variant
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFastTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // "fast" variant
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeClassElementHeap(elements: ElementContainer) {
    // Local
    timeHeap(ClassElementHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    
    // Framework
    timeFrameworkHeap(Framework.ClassElementHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeNonCoWHeap(elements: ElementContainer) {
    // Local
    timeHeap(NonCoWHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

