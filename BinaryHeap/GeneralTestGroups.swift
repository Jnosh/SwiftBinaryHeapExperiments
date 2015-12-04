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
    timeHeap(ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for ReferenceElement so we confine our testing to this case)
    timeHeapTransparent(ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Run test on "fast" variant
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for ReferenceElement so we confine our testing to this case)
    timeHeapTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFastTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // "fast" variant
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
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
    timeHeap(NonCoWHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(NonCoWHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeFrameworkHeap(Framework.NonCoWHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

