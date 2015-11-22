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
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClosureManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
}

func timeClosureArrayBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.smallValMeasurements, elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.medValMeasurements, elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.largeValMeasurements, elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.ptrRefMeasurements, elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, measurements.ptrValMeasurements, elements.ptrValElements)
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
