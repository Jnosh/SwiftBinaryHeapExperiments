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
    timeHeap(ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeArrayPointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Run test on "fast" variant
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeapFast(ArrayPointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // @transparent test (only seems to have impact for RefElement so we confine our testing to this case)
    timeHeapTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFastTransparent(ArrayPointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
}

func timeUnsafePointerHeap(elements: ElementContainer) {
    // Local
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.UnsafePointerHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeManagedBufferHeap(elements: ElementContainer) {
    // Local
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // "fast" variant
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timePtrElementHeap(elements: ElementContainer) {
    // Local
    timePtrElementHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timePtrElementHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timePtrElementHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timePtrElementHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timePtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timePtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timePtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)

    // Framework
    timeFrameworkPtrElementHeap(resultGroup: measurements.refMeasurements, elements: elements.refElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.smallValMeasurements, elements: elements.smallValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.medValMeasurements, elements: elements.mediumValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.largeValMeasurements, elements: elements.largeValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrRefMeasurements, elements: elements.ptrRefElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.ptrValMeasurements, elements: elements.ptrValElements)
    timeFrameworkPtrElementHeap(resultGroup: measurements.unmanagedMeasurements, elements: elements.unmanagedElements)
}

func timeClosureHeap(elements: ElementContainer) {
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

