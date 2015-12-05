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
    timeHeap(ArrayHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(ArrayHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(ArrayHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(ArrayHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(ArrayHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(ArrayHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayHeap.self, measurements.refMeasurements, elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(ArrayPointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(ArrayPointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(ArrayPointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Run test on "fast" variant
    timeHeapFast(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeapFast(ArrayPointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFastTransparent(ArrayPointerHeap.self, measurements.refMeasurements, elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(UnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(UnsafePointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(UnsafePointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(UnsafePointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(UnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(UnsafePointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(UnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeHeap(ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(ManagedBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(ManagedBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(ManagedBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(ManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // "fast" variant
    timeHeapFast(ManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeapFast(ManagedBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
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
    timeHeap(NonCoWHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(NonCoWHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(NonCoWHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(NonCoWHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(NonCoWHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(NonCoWHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

