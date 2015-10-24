//
//  main.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

// TODO: migrate & cleanup more stuff
// TODO: can we extract some more common stuff?

// TODO: tests...

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

// TODO: Also collect all tests when used with code in framework...
// TODO: experiment with @transparent, etc... effect on framework (maybe put this in Swift?)

// TODO: Collect results & sort by speed (where applicable)
// TODO: there's is quite a bit of variance in the results (prob due to randomized elements
//          -> perf obviously depends on elements & order)
//          -> run multiple iterations


// TODO: Variants (where possible) that use comparison closure instead of Comparable
//      Do we need to duplicate all or can we share some stuff?


let count = 10000
let iterations = 100

var resultsRef = ResultSetGroup(name: "RefElement")
var resultsSmallVal = ResultSetGroup(name: "ValElement Small")
var resultsMedVal = ResultSetGroup(name: "ValElement Medium")
var resultsLargeVal = ResultSetGroup(name: "ValElement Large")
var resultsPtrRef = ResultSetGroup(name: "PtrElement Ref")
var resultsPtrVal = ResultSetGroup(name: "PtrElement Val")
var resultsUnmanaged = ResultSetGroup(name: "UnmanagedElement")


for _ in 0..<iterations {
    let elementContainer = ElementContainer(count: count)

    let base = timeCFHeap(elementContainer.refElements)
    resultsRef["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsSmallVal["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsMedVal["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsLargeVal["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsPtrRef["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsPtrVal["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)
    resultsUnmanaged["CFBinaryHeap"].addMeasurement(base.insert, remove: base.remove)

    do {
        timeHeap(&resultsRef, heapType: ArrayHeap.self, elements: elementContainer.refElements)
        timeHeap(&resultsSmallVal, heapType: ArrayHeap.self, elements: elementContainer.smallValElements)
        timeHeap(&resultsMedVal, heapType: ArrayHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(&resultsLargeVal, heapType: ArrayHeap.self, elements: elementContainer.largeValElements)
        timeHeap(&resultsPtrRef, heapType: ArrayHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(&resultsPtrVal, heapType: ArrayHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(&resultsUnmanaged, heapType: ArrayHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(&resultsRef, heapType: ArrayPtrHeap.self, elements: elementContainer.refElements)
        timeHeap(&resultsSmallVal, heapType: ArrayPtrHeap.self, elements: elementContainer.smallValElements)
        timeHeap(&resultsMedVal, heapType: ArrayPtrHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(&resultsLargeVal, heapType: ArrayPtrHeap.self, elements: elementContainer.largeValElements)
        timeHeap(&resultsPtrRef, heapType: ArrayPtrHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(&resultsPtrVal, heapType: ArrayPtrHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(&resultsUnmanaged, heapType: ArrayPtrHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(&resultsRef, heapType: UnsafePtrHeap.self, elements: elementContainer.refElements)
        timeHeap(&resultsSmallVal, heapType: UnsafePtrHeap.self, elements: elementContainer.smallValElements)
        timeHeap(&resultsMedVal, heapType: UnsafePtrHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(&resultsLargeVal, heapType: UnsafePtrHeap.self, elements: elementContainer.largeValElements)
        timeHeap(&resultsPtrRef, heapType: UnsafePtrHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(&resultsPtrVal, heapType: UnsafePtrHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(&resultsUnmanaged, heapType: UnsafePtrHeap.self, elements: elementContainer.unmanagedElements)
    }

    do {
        timeHeap(&resultsRef, heapType: ManagedBufferHeap.self, elements: elementContainer.refElements)
        timeHeap(&resultsSmallVal, heapType: ManagedBufferHeap.self, elements: elementContainer.smallValElements)
        timeHeap(&resultsMedVal, heapType: ManagedBufferHeap.self, elements: elementContainer.mediumValElements)
        timeHeap(&resultsLargeVal, heapType: ManagedBufferHeap.self, elements: elementContainer.largeValElements)
        timeHeap(&resultsPtrRef, heapType: ManagedBufferHeap.self, elements: elementContainer.ptrRefElements)
        timeHeap(&resultsPtrVal, heapType: ManagedBufferHeap.self, elements: elementContainer.ptrValElements)
        timeHeap(&resultsUnmanaged, heapType: ManagedBufferHeap.self, elements: elementContainer.unmanagedElements)
    }
}

printResult(resultsRef)
print("")
printResult(resultsSmallVal)
print("")
printResult(resultsMedVal)
print("")
printResult(resultsLargeVal)
print("")
printResult(resultsPtrRef)
print("")
printResult(resultsPtrVal)
print("")
printResult(resultsUnmanaged)








