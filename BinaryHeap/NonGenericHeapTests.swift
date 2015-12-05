
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
    timeHeap(ReferenceElementHeap.self, measurements.refMeasurements, elements.refElements)
    timeHeap(SmallValueElementHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeHeap(MediumValueElementHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeHeap(LargeValueElementHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeHeap(PointerReferenceElementHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeHeap(PointerValueElementHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeHeap(UnmanagedElementHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)

    
    // Framework    
    timeFrameworkHeap(Framework.ReferenceElementHeap.self, measurements.refMeasurements, elements.frameworkReferenceElements)
    timeFrameworkHeap(Framework.SmallValueElementHeap.self, measurements.smallValueMeasurements, elements.frameworkSmallValueElements)
    timeFrameworkHeap(Framework.MediumValueElementHeap.self, measurements.medValueMeasurements, elements.frameworkMediumValueElements)
    timeFrameworkHeap(Framework.LargeValueElementHeap.self, measurements.largeValueMeasurements, elements.frameworkLargeValueElements)
    timeFrameworkHeap(Framework.PointerReferenceElementHeap.self, measurements.ptrRefMeasurements, elements.frameworkPointerReferenceElements)
    timeFrameworkHeap(Framework.PointerValueElementHeap.self, measurements.ptrValMeasurements, elements.frameworkPointerValueElements)
    timeFrameworkHeap(Framework.UnmanagedElementHeap.self, measurements.unmanagedMeasurements, elements.frameworkUnmanagedElements)
}
