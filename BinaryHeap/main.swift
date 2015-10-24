//
//  main.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

// TODO: migrate & cleanup more stuff
// TODO: can we extract some more common stuff?

// TODO: Additional variants
//      * Swift implementation of CFHeap
//      * ComboHeap(s) (might also try to make impl that uses separate subtypes for ref/val types)
//      * Heap that like CF uses UnsafePtr throughout but uses only internally
//          * -> Allocates ptrs for elements itself, moves there
//          * -> maybe best to allocate buffer together with buffer for heap (same size)
//          * -> in AnyObj case ideally just uses unsafeAddressOf with retain/release
//          * Maybe store very small (sizeof) value types directly instead of ptrs (< ~2 word?)
//          * Might be good idea to test basic idea with ManagedBufferHeap variant that uses
//          * unmanaged els for AnyObjects

// TODO: experiment with @transparent, etc... effect on framework (maybe put this in Swift?)

// TODO: Variants (where possible) that use comparison closure instead of Comparable
//      Do we need to duplicate all or can we share some stuff?


import Framework

let count = 10000
let iterations = 10


let resultsRef = ResultSetGroup(name: "RefElement")
let resultsSmallVal = ResultSetGroup(name: "ValElement Small")
let resultsMedVal = ResultSetGroup(name: "ValElement Medium")
let resultsLargeVal = ResultSetGroup(name: "ValElement Large")
let resultsPtrRef = ResultSetGroup(name: "PtrElement Ref")
let resultsPtrVal = ResultSetGroup(name: "PtrElement Val")
let resultsUnmanaged = ResultSetGroup(name: "UnmanagedElement")

let allResultGroups = [resultsRef, resultsSmallVal, resultsMedVal, resultsLargeVal, resultsPtrRef, resultsPtrVal, resultsUnmanaged]


// TODO: Maybe split this into several functions
//      Split by heap type or element type?

for _ in 0..<iterations {
    let elementContainer = ElementContainer(count: count)


    timeCFHeap(allResultGroups, elements: elementContainer.refElements)
    timeCFHeap(allResultGroups, elements: elementContainer.refElements)

    timeFrameworkCFHeap(allResultGroups, elements: elementContainer.refElements)
    timeFrameworkCFHeap(allResultGroups, elements: elementContainer.refElements)

    do {
        timeHeap(resultsRef, heapType: ArrayHeap.self, elements: elementContainer.refElements)
        timeHeap(resultsSmallVal, heapType: ArrayHeap.self, elements: elementContainer.smallValElements)
        timeHeap(resultsMedVal, heapType: ArrayHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(resultsLargeVal, heapType: ArrayHeap.self, elements: elementContainer.largeValElements)
        timeHeap(resultsPtrRef, heapType: ArrayHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(resultsPtrVal, heapType: ArrayHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(resultsUnmanaged, heapType: ArrayHeap.self, elements: elementContainer.unmanagedElements)

        timeFrameworkHeap(resultsRef, heapType: Framework.ArrayHeap.self, elements: elementContainer.refElements)
        timeFrameworkHeap(resultsSmallVal, heapType: Framework.ArrayHeap.self, elements: elementContainer.smallValElements)
        timeFrameworkHeap(resultsMedVal, heapType: Framework.ArrayHeap.self, elements: elementContainer.mediumValElements)
        timeFrameworkHeap(resultsLargeVal, heapType: Framework.ArrayHeap.self, elements: elementContainer.largeValElements)
        timeFrameworkHeap(resultsPtrRef, heapType: Framework.ArrayHeap.self, elements: elementContainer.ptrRefElements)
        timeFrameworkHeap(resultsPtrVal, heapType: Framework.ArrayHeap.self, elements: elementContainer.ptrValElements)
        timeFrameworkHeap(resultsUnmanaged, heapType: Framework.ArrayHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(resultsRef, heapType: ArrayPtrHeap.self, elements: elementContainer.refElements)
        timeHeap(resultsSmallVal, heapType: ArrayPtrHeap.self, elements: elementContainer.smallValElements)
        timeHeap(resultsMedVal, heapType: ArrayPtrHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(resultsLargeVal, heapType: ArrayPtrHeap.self, elements: elementContainer.largeValElements)
        timeHeap(resultsPtrRef, heapType: ArrayPtrHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(resultsPtrVal, heapType: ArrayPtrHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(resultsUnmanaged, heapType: ArrayPtrHeap.self, elements: elementContainer.unmanagedElements)

        timeFrameworkHeap(resultsRef, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.refElements)
        timeFrameworkHeap(resultsSmallVal, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.smallValElements)
        timeFrameworkHeap(resultsMedVal, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.mediumValElements)
        timeFrameworkHeap(resultsLargeVal, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.largeValElements)
        timeFrameworkHeap(resultsPtrRef, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.ptrRefElements)
        timeFrameworkHeap(resultsPtrVal, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.ptrValElements)
        timeFrameworkHeap(resultsUnmanaged, heapType: Framework.ArrayPtrHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(resultsRef, heapType: UnsafePtrHeap.self, elements: elementContainer.refElements)
        timeHeap(resultsSmallVal, heapType: UnsafePtrHeap.self, elements: elementContainer.smallValElements)
        timeHeap(resultsMedVal, heapType: UnsafePtrHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(resultsLargeVal, heapType: UnsafePtrHeap.self, elements: elementContainer.largeValElements)
        timeHeap(resultsPtrRef, heapType: UnsafePtrHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(resultsPtrVal, heapType: UnsafePtrHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(resultsUnmanaged, heapType: UnsafePtrHeap.self, elements: elementContainer.unmanagedElements)

        timeFrameworkHeap(resultsRef, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.refElements)
        timeFrameworkHeap(resultsSmallVal, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.smallValElements)
        timeFrameworkHeap(resultsMedVal, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.mediumValElements)
        timeFrameworkHeap(resultsLargeVal, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.largeValElements)
        timeFrameworkHeap(resultsPtrRef, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.ptrRefElements)
        timeFrameworkHeap(resultsPtrVal, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.ptrValElements)
        timeFrameworkHeap(resultsUnmanaged, heapType: Framework.UnsafePtrHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(resultsRef, heapType: ManagedBufferHeap.self, elements: elementContainer.refElements)
        timeHeap(resultsSmallVal, heapType: ManagedBufferHeap.self, elements: elementContainer.smallValElements)
        timeHeap(resultsMedVal, heapType: ManagedBufferHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(resultsLargeVal, heapType: ManagedBufferHeap.self, elements: elementContainer.largeValElements)
        timeHeap(resultsPtrRef, heapType: ManagedBufferHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(resultsPtrVal, heapType: ManagedBufferHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(resultsUnmanaged, heapType: ManagedBufferHeap.self, elements: elementContainer.unmanagedElements)

        timeFrameworkHeap(resultsRef, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.refElements)
        timeFrameworkHeap(resultsSmallVal, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.smallValElements)
        timeFrameworkHeap(resultsMedVal, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.mediumValElements)
        timeFrameworkHeap(resultsLargeVal, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.largeValElements)
        timeFrameworkHeap(resultsPtrRef, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.ptrRefElements)
        timeFrameworkHeap(resultsPtrVal, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.ptrValElements)
        timeFrameworkHeap(resultsUnmanaged, heapType: Framework.ManagedBufferHeap.self, elements: elementContainer.unmanagedElements)
    }
}

printResult(resultsRef)
printResult(resultsSmallVal)
printResult(resultsMedVal)
printResult(resultsLargeVal)
printResult(resultsPtrRef)
printResult(resultsPtrVal)
printResult(resultsUnmanaged)






