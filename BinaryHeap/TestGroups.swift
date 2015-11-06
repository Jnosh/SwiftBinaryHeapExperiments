//
//  TestGroups.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Framework

func timeArrayHeap(results results: ResultContainer, elements: ElementContainer) {
    timeHeap(ArrayHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeap(ArrayHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeap(ArrayHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeap(ArrayHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeap(ArrayHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeap(ArrayHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeap(ArrayHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeHeapTransparent(ArrayHeap.self, resultGroup: results.refResults, elements: elements.refElements)

    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timeArrayPtrHeap(results results: ResultContainer, elements: ElementContainer) {
    timeHeap(ArrayPtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeap(ArrayPtrHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeHeapTransparent(ArrayPtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeapFastTransparent(ArrayPtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)

    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeapFast(ArrayPtrHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ArrayPtrHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timeUnsafePtrHeap(results results: ResultContainer, elements: ElementContainer) {
    timeHeap(UnsafePtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeap(UnsafePtrHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.UnsafePtrHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timeManagedBufferHeap(results results: ResultContainer, elements: ElementContainer) {
    timeHeap(ManagedBufferHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeap(ManagedBufferHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeHeapFast(ManagedBufferHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
    
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timePtrElementHeap(results results: ResultContainer, elements: ElementContainer) {
    timePtrElementHeap(resultGroup: results.refResults, elements: elements.refElements)
    timePtrElementHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timePtrElementHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timePtrElementHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timePtrElementHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timePtrElementHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timePtrElementHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkPtrElementHeap(resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkPtrElementHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkPtrElementHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkPtrElementHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkPtrElementHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkPtrElementHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkPtrElementHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timeClosureHeap(results results: ResultContainer, elements: ElementContainer) {
    timeClosureHeap(resultGroup: results.refResults, elements: elements.refElements)
    timeClosureHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeClosureHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeClosureHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeClosureHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeClosureHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeClosureHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkClosureHeap(resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkClosureHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkClosureHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkClosureHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkClosureHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkClosureHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkClosureHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeClosureHeapLocalLiteral(resultGroup: results.refResults, elements: elements.refElements)
    timeClosureHeapLocalLiteral(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeClosureHeapLocalLiteral(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeClosureHeapLocalLiteral(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeClosureHeapLocalLiteral(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeClosureHeapLocalLiteral(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeClosureHeapLocalLiteral(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkClosureHeapLocalLiteral(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    let literal = "(argument literal)"
    timeClosureHeapArg(resultGroup: results.refResults, elements: elements.refElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.smallValResults, elements: elements.smallValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.medValResults, elements: elements.mediumValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.largeValResults, elements: elements.largeValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.ptrValResults, elements: elements.ptrValElements, name: literal) { $0 < $1 }
    timeClosureHeapArg(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements, name: literal) { $0 < $1 }

    timeFrameworkClosureHeapArg(resultGroup: results.refResults, elements: elements.refElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.smallValResults, elements: elements.smallValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.medValResults, elements: elements.mediumValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.largeValResults, elements: elements.largeValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.ptrValResults, elements: elements.ptrValElements, name: literal) { $0 < $1 }
    timeFrameworkClosureHeapArg(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements, name: literal) { $0 < $1 }

    let function = "(argument <)"
    timeClosureHeapArg(resultGroup: results.refResults, elements: elements.refElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.smallValResults, elements: elements.smallValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.medValResults, elements: elements.mediumValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.largeValResults, elements: elements.largeValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.ptrValResults, elements: elements.ptrValElements, name: function, isOrderedBefore: <)
    timeClosureHeapArg(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements, name: function, isOrderedBefore: <)

    timeFrameworkClosureHeapArg(resultGroup: results.refResults, elements: elements.refElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.smallValResults, elements: elements.smallValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.medValResults, elements: elements.mediumValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.largeValResults, elements: elements.largeValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.ptrValResults, elements: elements.ptrValElements, name: function, isOrderedBefore: <)
    timeFrameworkClosureHeapArg(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements, name: function, isOrderedBefore: <)}

