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

    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkHeap(Framework.ManagedBufferHeap.self, resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
}

func timeComparisonHeap(results results: ResultContainer, elements: ElementContainer) {
    timeComparisonHeap(resultGroup: results.refResults, elements: elements.refElements)
    timeComparisonHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeComparisonHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeComparisonHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeComparisonHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeComparisonHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeComparisonHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkComparisonHeap(resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkComparisonHeap(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkComparisonHeap(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkComparisonHeap(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkComparisonHeap(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkComparisonHeap(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkComparisonHeap(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)
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
}

func timeClosureHeapAlt(results results: ResultContainer, elements: ElementContainer) {
    timeClosureHeapAlt(resultGroup: results.refResults, elements: elements.refElements)
    timeClosureHeapAlt(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeClosureHeapAlt(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeClosureHeapAlt(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeClosureHeapAlt(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeClosureHeapAlt(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeClosureHeapAlt(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

    timeFrameworkClosureHeapAlt(resultGroup: results.refResults, elements: elements.refElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.smallValResults, elements: elements.smallValElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.medValResults, elements: elements.mediumValElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.largeValResults, elements: elements.largeValElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.ptrRefResults, elements: elements.ptrRefElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.ptrValResults, elements: elements.ptrValElements)
    timeFrameworkClosureHeapAlt(resultGroup: results.unmanagedResults, elements: elements.unmanagedElements)

}
