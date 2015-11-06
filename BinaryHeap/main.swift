//
//  main.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

// TODO: Maybe do one combo heap based on UnsafePtrHeap?

// Maybe retry VariantHeap using ManagedBufferPtr

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

    timeCFHeap(resultContainer.refResults, elements: elementContainer.refElements)
    timeFrameworkCFHeap(resultContainer.refResults, elements: elementContainer.refElements)

    timeArrayHeap(results: resultContainer, elements: elementContainer)
    timeArrayPtrHeap(results: resultContainer, elements: elementContainer)
    timeUnsafePtrHeap(results: resultContainer, elements: elementContainer)
    timeManagedBufferHeap(results: resultContainer, elements: elementContainer)

    timeHeap(ClassElementHeap.self, resultGroup: resultContainer.refResults, elements: elementContainer.refElements)
    timeFrameworkHeap(Framework.ClassElementHeap.self, resultGroup: resultContainer.refResults, elements: elementContainer.refElements)

    timePtrElementHeap(results: resultContainer, elements: elementContainer)

    timeClosureHeap(results: resultContainer, elements: elementContainer)
}


resultContainer.print()




