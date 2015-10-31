//
//  main.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

// Doesn't seem to be doable: (probably doable with closure for comparison instead of Comparable)
//      * Heap variant that internally uses unmanaged els for AnyObjects
//      * Not really doable well but might be able to if we use closure for comparison instead of Comparable
//      * -> get type in init
//         if Element.self is AnyObject { ... }


// TODO: experiment with @transparent, etc... effect on framework (maybe put this in perf testing project?)

// TODO: Why is ManagedBufferHeap slower than UnsafePtrHeap? Should be faster... Can we improve?

// Obviously, what kills perf for Framework cases is Generics...
// Perf diff there is mostly a question of how optimized non-specialized code is
// Using a closure for comparisons instead of '<' has little impact for local case
// as WMO takes care of that. For Framework case it adds ~1ms to running time.

import Framework

let elementCount = 10000
let iterations = 10

let resultContainer = ResultContainer()

for _ in 0..<iterations {
    let elementContainer = ElementContainer(count: elementCount)

    timeCFHeap(resultContainer.allResultGroups, elements: elementContainer.refElements)
    timeFrameworkCFHeap(resultContainer.allResultGroups, elements: elementContainer.refElements)

    timeHeap(ClassElementHeap.self, resultGroup: resultContainer.refResults, elements: elementContainer.refElements)
    timeFrameworkHeap(Framework.ClassElementHeap.self, resultGroup: resultContainer.refResults, elements: elementContainer.refElements)

    timeArrayHeap(results: resultContainer, elements: elementContainer)
    timeArrayPtrHeap(results: resultContainer, elements: elementContainer)
    timeUnsafePtrHeap(results: resultContainer, elements: elementContainer)
    timeManagedBufferHeap(results: resultContainer, elements: elementContainer)

    timeComparisonHeap(results: resultContainer, elements: elementContainer)

    timeClosureHeap(results: resultContainer, elements: elementContainer)
}


resultContainer.print()




