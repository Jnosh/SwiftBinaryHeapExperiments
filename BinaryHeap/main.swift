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

// TODO: Also collect all tests when used with code in framework...
// TODO: experiment with @transparent, etc... effect on framework (maybe put this in Swift?)

// TODO: Collect results & sort by speed (where applicable)
// TODO: there's is quite a bit of variance in the results (prob due to randomized elements
//          -> perf obviously depends on elements & order)
//          -> run multiple iterations


// TODO: Variants (where possible) that use comparison closure instead of Comparable
//      Do we need to duplicate all or can we share some stuff?



let count = 10000

// Generate nodes
let refNodes = (0..<count).map { _ in RefElement() }

let smallValNodes = (0..<count).map { _ in ValElementSmall() }
let mediumValNodes = (0..<count).map { _ in ValElementMedium() }
let largeValNodes = (0..<count).map { _ in ValElementLarge() }

let ptrRefElements: [PtrElement<RefElement>] = refNodes.map { PtrElement($0) }
let ptrValElements: [PtrElement<ValElementLarge>] = largeValNodes.map { PtrElement($0) }

let unmanagedElements = refNodes.map { UnmanagedElement($0) }



let base = timeCFHeap(refNodes)
printResult(base: base, measured: base)


do {
    let ref = timeHeap(ArrayHeap.self, elements: refNodes)
    printResult(base: base, measured: ref)

    let small = timeHeap(ArrayHeap.self, elements: smallValNodes)
    printResult(base: base, measured: small)
    
    let medium = timeHeap(ArrayHeap.self, elements: mediumValNodes)
    printResult(base: base, measured: medium)
    
    let large = timeHeap(ArrayHeap.self, elements: largeValNodes)
    printResult(base: base, measured: large)
    
    let ptrRef = timeHeap(ArrayHeap.self, elements: ptrRefElements)
    printResult(base: base, measured: ptrRef)
    
    let ptrVal = timeHeap(ArrayHeap.self, elements: ptrValElements)
    printResult(base: base, measured: ptrVal)
    
    let unmanaged = timeHeap(ArrayHeap.self, elements: unmanagedElements)
    printResult(base: base, measured: unmanaged)
}


do {
    let ref = timeHeap(ArrayPtrHeap.self, elements: refNodes)
    printResult(base: base, measured: ref)
    
    let small = timeHeap(ArrayPtrHeap.self, elements: smallValNodes)
    printResult(base: base, measured: small)
    
    let medium = timeHeap(ArrayPtrHeap.self, elements: mediumValNodes)
    printResult(base: base, measured: medium)
    
    let large = timeHeap(ArrayPtrHeap.self, elements: largeValNodes)
    printResult(base: base, measured: large)
    
    let ptrRef = timeHeap(ArrayPtrHeap.self, elements: ptrRefElements)
    printResult(base: base, measured: ptrRef)
    
    let ptrVal = timeHeap(ArrayPtrHeap.self, elements: ptrValElements)
    printResult(base: base, measured: ptrVal)
    
    let unmanaged = timeHeap(ArrayPtrHeap.self, elements: unmanagedElements)
    printResult(base: base, measured: unmanaged)
}

do {
    let ref = timeHeap(UnsafePtrHeap.self, elements: refNodes)
    printResult(base: base, measured: ref)

    let small = timeHeap(UnsafePtrHeap.self, elements: smallValNodes)
    printResult(base: base, measured: small)

    let medium = timeHeap(UnsafePtrHeap.self, elements: mediumValNodes)
    printResult(base: base, measured: medium)

    let large = timeHeap(UnsafePtrHeap.self, elements: largeValNodes)
    printResult(base: base, measured: large)

    let ptrRef = timeHeap(UnsafePtrHeap.self, elements: ptrRefElements)
    printResult(base: base, measured: ptrRef)

    let ptrVal = timeHeap(UnsafePtrHeap.self, elements: ptrValElements)
    printResult(base: base, measured: ptrVal)

    let unmanaged = timeHeap(UnsafePtrHeap.self, elements: unmanagedElements)
    printResult(base: base, measured: unmanaged)
}

do {
    let ref = timeHeap(ManagedBufferHeap.self, elements: refNodes)
    printResult(base: base, measured: ref)
    
    let small = timeHeap(ManagedBufferHeap.self, elements: smallValNodes)
    printResult(base: base, measured: small)
    
    let medium = timeHeap(ManagedBufferHeap.self, elements: mediumValNodes)
    printResult(base: base, measured: medium)
    
    let large = timeHeap(ManagedBufferHeap.self, elements: largeValNodes)
    printResult(base: base, measured: large)
    
    let ptrRef = timeHeap(ManagedBufferHeap.self, elements: ptrRefElements)
    printResult(base: base, measured: ptrRef)
    
    let ptrVal = timeHeap(ManagedBufferHeap.self, elements: ptrValElements)
    printResult(base: base, measured: ptrVal)
    
    let unmanaged = timeHeap(ManagedBufferHeap.self, elements: unmanagedElements)
    printResult(base: base, measured: unmanaged)
}







