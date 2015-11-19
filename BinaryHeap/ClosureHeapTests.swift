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
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeClosureHeap(ClosureUnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkClosureHeap(Framework.ClosureUnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeClosureManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeClosureHeap(ClosureManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkClosureHeap(Framework.ClosureManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeClosureArrayBufferHeap(elements: ElementContainer) {
    // Local
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeClosureHeap(ClosureArrayBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkClosureHeap(Framework.ClosureArrayBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
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
    
    
    let name = removeGenerics(String(heapType))
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
    
    
    let name = removeGenerics(String(reflecting: heapType))
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
