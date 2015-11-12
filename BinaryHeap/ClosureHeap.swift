//
//  ClosureHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//


private final class ClosureHeapStorage<Element> : NonObjectiveCBase {
    private var buffer: UnsafeMutablePointer<Element>
    private var capacity: Int
    private var count: Int

    private override init() {
        buffer = nil
        count = 0
        capacity = 0
    }
    
    deinit {
        buffer.destroy(count)
        buffer.dealloc(capacity)
    }
}

public struct ClosureHeap<Element> {
    private var storage: ClosureHeapStorage<Element>
    private let isOrderedBefore: (Element, Element) -> Bool

    public init(isOrderedBefore: (Element, Element) -> Bool) {
        storage = ClosureHeapStorage()
        self.isOrderedBefore = isOrderedBefore
    }

    private mutating func reserveCapacity(minimumCapacity: Int) {
        if storage.capacity < minimumCapacity {
            let newCapacity = nextPoW2(minimumCapacity)
            let newBuffer = UnsafeMutablePointer<Element>.alloc(newCapacity)

            if isUniquelyReferenced(&storage) {
                newBuffer.moveInitializeFrom(storage.buffer, count: count)
                storage.buffer.dealloc(storage.capacity)
            } else {
                newBuffer.initializeFrom(storage.buffer, count: count)
                storage = ClosureHeapStorage()
            }

            storage.buffer = newBuffer
            storage.capacity = newCapacity
        }
    }

    private mutating func ensureUniquelyReferenced() {
        if !isUniquelyReferenced(&storage) {
            let newStorage = ClosureHeapStorage<Element>()
            newStorage.capacity = storage.capacity
            newStorage.count = storage.count

            newStorage.buffer = UnsafeMutablePointer.alloc(newStorage.capacity)
            newStorage.buffer.initializeFrom(storage.buffer, count: storage.count)

            storage = newStorage
        }
    }

}

// MARK: BinaryHeapType conformance
extension ClosureHeap {
    public var count: Int {
        return storage.count
    }

    public var first: Element? {
        return count > 0 ? storage.buffer.memory : nil
    }

    public var isEmpty: Bool {
        return count == 0
    }

    public mutating func insert(value: Element) {
        var index = count
        // Optimization to prevent uneccessary copy
        // If we need to resize our element buffer we are guaranteed to have a unique copy afterwards
        if count == storage.capacity {
            reserveCapacity(count + 1)
        } else {
            ensureUniquelyReferenced()
        }

        storage.buffer.advancedBy(count).initialize(value)
        storage.count++


        while index > 0 && isOrderedBefore(value, storage.buffer[parentIndex(index)]) {
            swap(&storage.buffer[index], &storage.buffer[parentIndex(index)])
            index = parentIndex(index)
        }
    }

    private func heapify(elements: UnsafeMutablePointer<Element>, startIndex: Int, endIndex: Int) {
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

            // Ensure the smallest element is at 'index' and recurse if neccessary
            if minIndex != index {
                swap(&elements[index], &elements[minIndex])
                index = minIndex
            } else {
                return
            }
        }
    }

    public mutating func removeFirst() -> Element {
        precondition(!isEmpty, "Heap may not be empty.")
        ensureUniquelyReferenced()

        storage.count = storage.count - 1
        if count > 0 {
            swap(&storage.buffer[0], &storage.buffer[count])
            heapify(storage.buffer, startIndex: 0, endIndex: count)
        }
        
        return storage.buffer.advancedBy(count).move()
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        ensureUniquelyReferenced()

        storage.buffer.destroy(storage.count)
        storage.buffer.dealloc(storage.capacity)
        storage.count = 0
        storage.capacity = 0
        storage.buffer = nil
    }
}


// MARK: Printing
/*
extension ClosureHeap: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }
    
    public var description: String {
        return binaryHeapDescription(self)
    }
}
*/

extension ClosureHeap: _DestructorSafeContainer { }
