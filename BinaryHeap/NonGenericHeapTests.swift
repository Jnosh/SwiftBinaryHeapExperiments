//
//  TestNonGenericHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 22/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework

func timeNonGenericHeaps(elements: ElementContainer) {
    // Local
    timeHeap(ReferenceElementHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(SmallValueElementHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(MediumValueElementHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(LargeValueElementHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(PointerReferenceElementHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(PointerValueElementHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(UnmanagedElementHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    
    // Framework    
    timeFrameworkHeap(Framework.ReferenceElementHeap.self, resultGroup: measurements.refMeasurements, elements: elements.frameworkRefElements)
    timeFrameworkHeap(Framework.SmallValueElementHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.frameworkSmallValElements)
    timeFrameworkHeap(Framework.MediumValueElementHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.frameworkMediumValElements)
    timeFrameworkHeap(Framework.LargeValueElementHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.frameworkLargeValElements)
    timeFrameworkHeap(Framework.PointerReferenceElementHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.frameworkPtrRefElements)
    timeFrameworkHeap(Framework.PointerValueElementHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.frameworkPtrValElements)
    timeFrameworkHeap(Framework.UnmanagedElementHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.frameworkUnmanagedElements)
}
