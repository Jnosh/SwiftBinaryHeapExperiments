//
//  ManagedArrayBuffer.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 12/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Wrapper for the instance variables stored with the `ManagedArrayBufferStorage`
private struct ValueWrapper {
    var count: Int
    let capacity: Int
}

/// A `ManagedBuffer` subclass that stores a count and capacity.
///
/// Some testing shows that as expected, ManagedBuffer objects are a linear buffer for the object
/// runtime data, `value` and elements.
///
///     <object> <padding> <value> <padding> <elements>
private final class ManagedArrayBufferStorage<Element>: ManagedBuffer<ValueWrapper, Element> {
    static func createManagedArrayBuffer(minimumCapacity: Int) -> ManagedArrayBufferStorage<Element> {
        let buffer = ManagedArrayBufferStorage.create(minimumCapacity) {
            return ValueWrapper(count: 0, capacity: $0.allocatedElementCount)
        }
        
        return unsafeDowncast(buffer)
    }
    
    static func createManagedArrayBuffer(minimumCapacity: Int,
                                         sourceBuffer: ManagedArrayBufferStorage<Element>,
                                         destroySourceContents: Bool = false) -> ManagedArrayBufferStorage<Element> {
        let newBuffer = ManagedArrayBufferStorage.createManagedArrayBuffer(minimumCapacity)
        newBuffer.withUnsafeMutablePointers { (newValuePtr, newElements) -> Void in
            sourceBuffer.withUnsafeMutablePointers { (valuePtr, elements) in
                precondition(minimumCapacity >= valuePtr.memory.capacity)
                
                let count = valuePtr.memory.count
                newValuePtr.memory.count = count
                if (destroySourceContents) {
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
        withUnsafeMutablePointers { (valuePtr, elementPtr) -> Void in
            elementPtr.destroy(valuePtr.memory.count)
            valuePtr.destroy()
        }
    }
}

/// A wrapper around a `ManagedBuffer`, providing some common functionality like resizing and CoW
/// support.
///
/// - Attention: Unless noted otherwise, it is the client's responsibility to initialize and
///              destroy elements in the buffer. One exception being the `count` elements
///              remaining in the buffer when it is no longer referenced which will be
///              destroyed automatically when the buffer is deallocated.
/// - Attention: Elements **must** be stored sequentially starting at the pointer passed in
///              `withUnsafeMutablePointer()`.
/// - Attention: `count` **must** be maintained by the client to accurately reflect the number of
///              initialized elements in the buffer.
internal struct ManagedArrayBuffer<Element> {
    private var storage: ManagedArrayBufferStorage<Element>
    
    /// The capacity of this buffer.
    var capacity: Int {
        return storage.value.capacity
    }
    
    /// The number of elements that the buffer stores.
    ///
    /// Use this to store the number of currently initialized elements.
    /// It is important that this number is accurate as it will be used to determine how many
    /// elements still need to be destroyed when the buffer is deallocated.
    var count: Int {
        get { return storage.value.count }
        set { storage.value.count = newValue }
    }
    
    /// Create an empty `ManagedArrayBuffer` that can store at least `minimumCapacity` elements.
    init(minimumCapacity: Int = 0) {
        storage = ManagedArrayBufferStorage.createManagedArrayBuffer(minimumCapacity)
    }

    /// Returns true iff `self` holds the only strong reference to its buffer.
    mutating func holdsUniqueReference() -> Bool {
        return isUniquelyReferenced(&storage)
    }

    /// Ensures that `self` holds the only strong reference to its buffer by copying the buffer
    /// contents if neccessary.
    ///
    /// Call this function before editing the buffer contents through `elements` to maintain
    /// CoW semantics. You do not need to call this before for read only access.
    ///
    /// - Postcondition: `holdsUniqueReference() == true`
    mutating func ensureHoldsUniqueReference() {
        if !holdsUniqueReference() {
            storage = ManagedArrayBufferStorage.createManagedArrayBuffer(capacity,
                sourceBuffer: storage)
        }
    }

    /// Call `body` with an `UnsafeMutablePointer` to the `Element` storage.
    ///
    /// - Note: This pointer is only valid for the duration of the call to `body`.
    /// - Bug: [ManagedProtoBuffer's withUnsafeMutablePointer* function arguments should be marked @noescape](http://www.openradar.me/23519592)
    func withUnsafeMutablePointer<R>(body: (UnsafeMutablePointer<Element>) -> R) -> R {
        return storage.withUnsafeMutablePointerToElements(body)
    }

    /// Reserve enough space to store at least `minimumCapacity` elements while maintaining CoW
    /// semantics.
    ///
    /// - Postcondition: `capacity >= minimumCapacity`.
    /// - Complexity: O(`count`).
    /// - Note: `minimumCapacity > capacity` before calling `reserveCapacity()` implies
    ///         `holdsUniqueReference() == true` after calling `reserveCapacity()`
    mutating func reserveCapacity(minimumCapacity: Int) {
        if capacity < minimumCapacity {
            // If we hold the only reference to managedBuffer, we can safely destroy the elements
            // during the copy process.
            let destroy = holdsUniqueReference()
            storage = ManagedArrayBufferStorage.createManagedArrayBuffer(minimumCapacity,
                                                            sourceBuffer: storage,
                                                   destroySourceContents: destroy)
        }
    }

    /// Grow the buffer so it is large enough to store at least `minimumCapacity` elements while
    /// ensuring that the buffer grows exponentially.
    ///
    /// - Postcondition: `capacity >= minimumCapacity && minimumCapacity > oldCapacity => newCapacity >= 2 * oldCapacity`.
    /// - Complexity: O(`count`).
    /// - Note: `minimumCapacity > capacity` before calling `grow()` implies
    ///         `holdsUniqueReference() == true` after calling `grow()`
    mutating func grow(minimumCapacity: Int) {
        if capacity < minimumCapacity {
            let requestedCapacity = max(2 * capacity, minimumCapacity)
            reserveCapacity(requestedCapacity)
        }
    }

    /// Remove all elements stored in this buffer.
    ///
    /// This will destroy the `count` elements stored in this buffer while maintaining CoW
    /// semantics.
    ///
    /// - Parameter `keepCapacity`: If true, is a non-binding request to avoid releasing storage, which
    ///                             can be a useful optimization when self is going to be grown again.
    /// - Complexity: O(`count`)
    /// - Precondition: The buffer holds `count` initialized elements.
    /// - Postcondition: `count == 0 && holdsUniqueReference() == true`
    /// - Note: Do not destroy the elements yourself before calling this function as they will be
    ///         destroyed automatically.
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        if holdsUniqueReference() && keepCapacity {
            // Destroy the elements but keep the buffer
            let count = self.count
            withUnsafeMutablePointer { $0.destroy(count) }
            self.count = 0
        } else {
            // Create a new buffer
            let newCapacity = keepCapacity ? capacity : 0
            storage = ManagedArrayBufferStorage.createManagedArrayBuffer(newCapacity)
        }
    }
}

