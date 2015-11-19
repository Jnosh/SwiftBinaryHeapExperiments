//
//  ClosureHeapTestsNonGeneric.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 19/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Chronos
import Framework


func timeClosureUnsafePointerHeapNonGeneric(elements: ElementContainer) {
    // Local (<)
    timeClosureHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeClosureHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeClosureHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeClosureHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeClosureHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeClosureHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeClosureHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework (<)
    timeFrameworkClosureHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkClosureHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkClosureHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkClosureHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkClosureHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkClosureHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkClosureHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Variant with closure literal
    timeClosureHeapLocalLiteral(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Framework + closure literal
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
    
    // Local + argument literal
    let literal = "(argument literal)"
    timeClosureHeapArg(resultGroup: measurements.refMeasurements, elements: elements.refElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements, name: literal) { $0 < $1 }
    
    // Framework + argument literal
    timeFrameworkClosureHeapArg(resultGroup: measurements.refMeasurements, elements: elements.refElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements, name: literal) { $0 < $1 }
    
    // Local + argument <
    let function = "(argument <)"
    timeClosureHeapArg(resultGroup: measurements.refMeasurements, elements: elements.refElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements, name: function, isOrderedBefore: <)
    
    // Framework + argument <
    timeFrameworkClosureHeapArg(resultGroup: measurements.refMeasurements, elements: elements.refElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements, name: function, isOrderedBefore: <)
}

private func timeClosureHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    // http://www.openradar.me/23428804
    var heap = ClosureUnsafePointerHeap<E>(isOrderedBefore: <)
    
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
    
    
    let name = removeGenerics(String(ClosureUnsafePointerHeap<E>.self)) + " (local <)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureHeap<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    var heap = Framework.ClosureUnsafePointerHeap<E>(isOrderedBefore: <)
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
    
    
    let name = removeGenerics(String(reflecting: Framework.ClosureUnsafePointerHeap<E>.self)) + " (local <)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeClosureHeapLocalLiteral<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    var heap = ClosureUnsafePointerHeap<E>() { $0 < $1 }
    
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
    
    
    let name = removeGenerics(String(ClosureUnsafePointerHeap<E>.self)) + " (local literal)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureHeapLocalLiteral<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E]) {
    var heap = Framework.ClosureUnsafePointerHeap<E>() { $0 < $1 }
    
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
    
    
    let name = removeGenerics(String(reflecting: Framework.ClosureUnsafePointerHeap<E>.self)) + " (local literal)"
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}


private func timeClosureHeapArg<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E], name variantName: String, isOrderedBefore: (E, E) -> Bool) {
    var heap = ClosureUnsafePointerHeap<E>(isOrderedBefore: isOrderedBefore)
    
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
    
    
    let name = removeGenerics(String(ClosureUnsafePointerHeap<E>.self)) + " " + variantName
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}

private func timeFrameworkClosureHeapArg<E: Comparable>(resultGroup resultGroup: MeasurementGroup, elements: [E], name variantName: String, isOrderedBefore: (E, E) -> Bool) {
    var heap = Framework.ClosureUnsafePointerHeap<E>(isOrderedBefore: isOrderedBefore)
    
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
    
    
    let name = removeGenerics(String(reflecting: Framework.ClosureUnsafePointerHeap<E>.self)) + " " + variantName
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
