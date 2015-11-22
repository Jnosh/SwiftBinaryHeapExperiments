//
//  Shared.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 17/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation // malloc_good_size

extension UnsafeMutablePointer {
    /// Allocate memory for at least `minimumCapacity` objects of type Memory.
    ///
    /// Returns both the pointer to the allocated memory as well as the actual capacity
    /// of the buffer. This is the value that should be passed to `dealloc`.
    ///
    /// - Warning: This is based on the fact that UnsafeMutablePointer.alloc is currently built on
    ///            malloc and may break in the future.
    static func allocSmart(minimumCapacity: Int) -> (UnsafeMutablePointer<T>, Int) {
        let stride = strideof(T)
        let actualCapacity = Int(malloc_good_size(UInt(stride * minimumCapacity))) / stride
        return (alloc(actualCapacity), actualCapacity)
    }
}

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

        // Ensure the smallest element is at 'index' and recurs if neccessary
        // Using loop since we don't have guaranteed tail recursion
        if minIndex != index {
            swap(&elements[index], &elements[minIndex])
            index = minIndex
        } else {
            return
        }
    }
}

/// Restore heap condition
internal func heapify<Element>(elements: UnsafeMutablePointer<Element>, startIndex: Int, endIndex: Int, isOrderedBefore: (Element, Element) -> Bool) {
    assert(startIndex >= 0)
    
    var index = startIndex
    while true {
        assert(index >= startIndex)
        assert(index < endIndex)
        
        let leftIndex = leftChildIndex(index)
        let rightIndex = rightChildIndex(index)
        
        // Find the minimum among the element at 'index' and its children
        var minIndex = index
        if leftIndex < endIndex && isOrderedBefore(elements[leftIndex], elements[index]) {
            minIndex = leftIndex
        }
        if rightIndex < endIndex && isOrderedBefore(elements[rightIndex], elements[minIndex]) {
            minIndex = rightIndex
        }
        
        // Ensure the smallest element is at 'index' and recurs if neccessary
        // Using loop since we don't have guaranteed tail recursion
        if minIndex != index {
            swap(&elements[index], &elements[minIndex])
            index = minIndex
        } else {
            return
        }
    }
}


// Potential extra features
//  * Give access to array with elements
//  * capacity / reserveCapacity()
//  * elements in reverse order
//  * Init from existing sequence/collection

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

/*
public init<S: SequenceType where S.Generator.Element == Element>(elements: S, isOrderedBefore: (Element, Element) -> Bool) {
    storage = Array(elements)
    self.isOrderedBefore = isOrderedBefore

    // Heapify all non-leaves to create heap
    let stride = (storage.count / 2).stride(to: 0, by: -1)
    for index in stride {
        heapify(index)
    }
}
*/


