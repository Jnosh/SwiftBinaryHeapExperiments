//
//  Shared.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation


/// Returns the index for the left child of the given index
@transparent internal func leftChildIndex(index: Int) -> Int {
    assert(index >= 0)
    return 2 * index + 1
}

/// Returns the index for the right child of the given index
@transparent internal func rightChildIndex(index: Int) -> Int {
    assert(index >= 0)
    return 2 * index + 2
}

/// Returns the index for the parent of the given index
@transparent internal func parentIndex(index: Int) -> Int {
    assert(index > 0)
    return (index - 1) / 2
}

/// Returns the smallest power-of-two >= `i`
@transparent internal func nextPoW2(i: Int) -> Int {
    var x = Int64(i)
    x--
    x |= x >> 1  // handle  2 bit numbers
    x |= x >> 2  // handle  4 bit numbers
    x |= x >> 4  // handle  8 bit numbers
    x |= x >> 8  // handle 16 bit numbers
    x |= x >> 16 // handle 32 bit numbers
    x |= x >> 32 // handle 64 bit numbers
    x++
    return Int(x)
}

// TODO: alternative: just use UnsafeMutableBufferPointer (with already advanced start ptr)

/// Restore heap condition
internal func heapify<E : Comparable>(elements: UnsafeMutablePointer<E>, startIndex: Int, endIndex: Int) {
    assert(startIndex >= 0)

    var index = startIndex
    while true {
        assert(index >= startIndex)
        assert(index < endIndex)

        let leftIndex = leftChildIndex(index)
        let rightIndex = rightChildIndex(index)

        // Find the minimum among the element at 'index' and its children
        var minIndex = index
        if leftIndex < endIndex && (elements[leftIndex] < elements[index]) {
            minIndex = leftIndex
        }
        if rightIndex < endIndex && (elements[rightIndex] < elements[minIndex]) {
            minIndex = rightIndex
        }

        // Ensure the smallest element is at 'index' and recurse if neccessary
        if minIndex != index {
            swap(&elements[index], &elements[minIndex])
            index = minIndex
        } else {
            return
        }
    }
}



internal func binaryHeapDescription<HeapType: BinaryHeapType>(heap: HeapType) -> String {
    // TODO: do this properly

    var result = "["
    for element in GeneratorSequence(heap.generate()) {
        result += String(element)
    }
    result += "]"

    return result
}

// TODO: traversal / printing functions
//      * Depth first (pre-order, in-order, post-order)
//      * Breadth-first search
//
// Problem: need access at tree level...
// Either provide internal hooks or maybe internal protocol
// Maybe sub-protocol to BinaryHeapType 
//
// Might also get by by getting heap as array out of type (which we could put in BinaryHeapType)



// Might also think about potential extra features where possible
//  * Give access to array with elements
//  * capacity / reserveCapacity()
//  * elements in reverse order (should be possible faster using internal knowledge)

/*
public var reverseSortedArray: [Element] {
    var copy = storage

    copy.withUnsafeMutableBufferPointer {
        (inout buffer: UnsafeMutableBufferPointer<Element>) -> Void in
        let stride = (buffer.count - 1).stride(to: 0, by: -1)

        for length in stride {
            swap(&buffer[0], &buffer[length])
            heapify(buffer, startIndex: 0, endIndex: length)
        }
    }
    return copy
}
*/



