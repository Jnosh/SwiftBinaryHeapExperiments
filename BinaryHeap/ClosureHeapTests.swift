//
//  ClosureHeapTests.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


func timeClosureUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClosureManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClosureArrayBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

private func timeClosureHeap<Heap : ClosureBinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = heapType.init() { $0 < $1 }
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()
    
    
    let name = removeGenerics(String(stringInterpolationSegment: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureHeap<Heap : Framework.ClosureBinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, resultGroup: MeasurementGroup, elements: [Element]) {
    var heap = heapType.init() { $0 < $1 }
    
    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()
    
    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()
    
    
    let name = removeGenerics(String(stringInterpolationSegment: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
