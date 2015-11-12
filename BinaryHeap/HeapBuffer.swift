//
//  HeapBuffer.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 12/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Wrapper for the instance variables stored with the `ManagedArrayBuffer`
private struct ValueWrapper {
    var count: Int
    let capacity: Int
}

/// A `ManagedBuffer` subclass that stores a count and capacity
///
/// Some testing shows that as expected, ManagedBuffer object store the elements inline
/// to prevent a second pointer indirection:
///
///     <object> <padding> <ValueWrapper> <padding> <elements>
private final class ManagedArrayBuffer<Element>: ManagedBuffer<ValueWrapper, Element> {
    static func createManagedArrayBuffer(minimumCapacity: Int) -> ManagedArrayBuffer<Element> {
        let buffer = ManagedArrayBuffer.create(minimumCapacity) {
            return ValueWrapper(count: 0, capacity: $0.allocatedElementCount)
        }
        
        return unsafeDowncast(buffer)
    }
    
    static func createManagedArrayBuffer(minimumCapacity: Int,
                                         copyElementsFromBuffer buffer: ManagedArrayBuffer<Element>,
                                         destroyBufferContents: Bool = false) -> ManagedArrayBuffer<Element> {
        let newBuffer = ManagedArrayBuffer.createManagedArrayBuffer(minimumCapacity)
        newBuffer.withUnsafeMutablePointers { (newValuePtr, newElements) in
            buffer.withUnsafeMutablePointers { (valuePtr, elements) in
                precondition(minimumCapacity >= valuePtr.memory.capacity)
                
                let count = valuePtr.memory.count
                newValuePtr.memory.count = count
                if (destroyBufferContents) {
                    newElements.moveInitializeFrom(elements, count: count)
                    valuePtr.memory.count = 0
                } else {
                    newElements.initializeFrom(elements, count: count)
                }
            }
        }
        
        return newBuffer
    }
    
    deinit {
        // We own the elements in the buffer - destroy them
        withUnsafeMutablePointers { (valuePtr, elementPtr) in
            elementPtr.destroy(valuePtr.memory.count)
            valuePtr.destroy()
        }
    }
}

/// A wrapper around a `ManagedBuffer` object to provide a nicer interface and some common functionality.
///
/// - Attention: It is the client's responsibility to initialize and destroy elements in the buffer.
///              However, when the buffer is deallocated, `count` elements are destroyed automatically.
internal struct HeapBuffer<Element> {
    private var managedBuffer: ManagedArrayBuffer<Element>
    
    /// The capacity of this buffer.
    var capacity: Int {
        return managedBuffer.value.capacity
    }
    
    /// The number of elements that the buffer stores.
    var count: Int {
        get { return managedBuffer.value.count }
        set { managedBuffer.value.count = newValue }
    }
    
    /// Create an empty `HeapBuffer` that can store at least `minimumCapacity` elements.
    init(minimumCapacity: Int = 0) {
        managedBuffer = ManagedArrayBuffer.createManagedArrayBuffer(minimumCapacity)
    }
    
    /// Reserve enough space to store `minimumCapacity` elements.
    ///
    /// - Postcondition: `capacity >= minimumCapacity`.
    /// - Complexity: O(`count`).
    mutating func reserveCapacity(minimumCapacity: Int) {
        if capacity < minimumCapacity {
            let newCapacity = nextPoW2(minimumCapacity)
            // If we hold the only reference to managedBuffer, we can safely destroy the elements
            // during the copy process.
            let destroy = holdsUniqueReference()
            managedBuffer = ManagedArrayBuffer.createManagedArrayBuffer(newCapacity,
                                                copyElementsFromBuffer: managedBuffer,
                                                destroyBufferContents: destroy)
        }
    }

    /// Returns true iff `self` holds the only strong reference to its buffer.
    mutating func holdsUniqueReference() -> Bool {
        return isUniquelyReferenced(&managedBuffer)
    }
    
    /// Ensures that `self` holds the only strong reference to its buffer by copying the buffer contents
    /// if neccessary.
    ///
    /// - Postcondition: `holdsUniqueReference() == true`
    mutating func ensureHoldsUniqueReference() {
        if !holdsUniqueReference() {
            managedBuffer = ManagedArrayBuffer.createManagedArrayBuffer(capacity, copyElementsFromBuffer: managedBuffer)
        }
    }
    
    /// Call `body` with an `UnsafeMutablePointer` to the `Element` storage.
    ///
    /// - Note: This pointer is only valid for the duration of the call to `body`.
    /// - Bug: [ManagedProtoBuffer's withUnsafeMutablePointer* function arguments should be marked @noescape](http://www.openradar.me/23519592)
    func withUnsafeMutablePointer<R>(body: (UnsafeMutablePointer<Element>) -> R) -> R {
        return managedBuffer.withUnsafeMutablePointerToElements(body)
    }
}

