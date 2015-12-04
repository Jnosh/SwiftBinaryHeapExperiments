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
    timeHeap(SmallValueElementHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValueElements)
    timeHeap(MediumValueElementHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValueElements)
    timeHeap(LargeValueElementHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValueElements)
    timeHeap(PointerReferenceElementHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.pointerReferenceElements)
    timeHeap(PointerValueElementHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.pointerValueElements)
    timeHeap(UnmanagedElementHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    
    // Framework    
    timeFrameworkHeap(Framework.ReferenceElementHeap.self, resultGroup: measurements.refMeasurements, elements: elements.frameworkReferenceElements)
    timeFrameworkHeap(Framework.SmallValueElementHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.frameworkSmallValueElements)
    timeFrameworkHeap(Framework.MediumValueElementHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.frameworkMediumValueElements)
    timeFrameworkHeap(Framework.LargeValueElementHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.frameworkLargeValueElements)
    timeFrameworkHeap(Framework.PointerReferenceElementHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.frameworkPointerReferenceElements)
    timeFrameworkHeap(Framework.PointerValueElementHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.frameworkPointerValueElements)
    timeFrameworkHeap(Framework.UnmanagedElementHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.frameworkUnmanagedElements)
}
