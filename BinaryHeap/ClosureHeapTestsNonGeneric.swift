
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
    // Variant with closure literal
    timeClosureHeapLocalLiteral(resultGroup: measurements.refMeasurements, elements.refElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements)
    timeClosureHeapLocalLiteral(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Framework + closure literal
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.refMeasurements, elements.refElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements)
    
    // Local + argument literal
    let literal = "(argument literal)"
    timeClosureHeapArg(resultGroup: measurements.refMeasurements, elements.refElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements, name: literal) { $0 < $1 }
    
    // Framework + argument literal
    timeFrameworkClosureHeapArg(resultGroup: measurements.refMeasurements, elements.refElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements, name: literal) { $0 < $1 }
    
    // Local + argument <
    let function = "(argument <)"
    timeClosureHeapArg(resultGroup: measurements.refMeasurements, elements.refElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements, name: function, <)
    timeClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements, name: function, <)
    
    // Framework + argument <
    timeFrameworkClosureHeapArg(resultGroup: measurements.refMeasurements, elements.refElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.smallValueMeasurements, elements.smallValueElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.medValueMeasurements, elements.mediumValueElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.largeValueMeasurements, elements.largeValueElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrRefMeasurements, elements.pointerReferenceElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.ptrValMeasurements, elements.pointerValueElements, name: function, <)
    timeFrameworkClosureHeapArg(resultGroup: measurements.unmanagedMeasurements, elements.unmanagedElements, name: function, <)
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
    

    let name = removeGenerics(String(stringInterpolationSegment: ClosureUnsafePointerHeap<E>.self)) + " (local literal)"
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
    
    
    let name = removeGenerics(String(stringInterpolationSegment: Framework.ClosureUnsafePointerHeap<E>.self)) + " (local literal)"
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
    
    
    let name = removeGenerics(String(stringInterpolationSegment: ClosureUnsafePointerHeap<E>.self)) + " " + variantName
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
    
    
    let name = removeGenerics(String(stringInterpolationSegment: Framework.ClosureUnsafePointerHeap<E>.self)) + " " + variantName
    resultGroup[name].addMeasurement(insertTime, remove: removeTime)
}
