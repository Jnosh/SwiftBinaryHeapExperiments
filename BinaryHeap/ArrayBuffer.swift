//
//  ArrayBuffer.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 13/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Storage class backing `ArrayBuffer` used to implement CoW behaviour.
private final class ArrayBufferStorage<Element> : NonObjectiveCBase {
    /// The pointer to the elements.
    private var elements: UnsafeMutablePointer<Element>
    /// The capacity of `elements`.
    private var capacity: Int
    /// The number of elements that the buffer stores.
    private var count: Int
    
    private override init() {
        elements = nil
        count = 0
        capacity = 0
    }
    
    private init(capacity: Int, sourceBuffer buffer: ArrayBufferStorage<Element>, destroySourceContents: Bool = false) {
        // Allocate a new buffer
        elements = UnsafeMutablePointer<Element>.alloc(capacity)
        count = buffer.count
        self.capacity = capacity

        // Copy the contents to the new buffer, destroying the contents of buffer if
        // destroySourceContents is set
        if destroySourceContents {
            elements.moveInitializeFrom(buffer.elements, count: count)
            buffer.count = 0
        } else {
            elements.initializeFrom(buffer.elements, count: count)
        }
    }
    
    deinit {
        elements.destroy(count)
        elements.dealloc(capacity)
    }
}

/// A wrapper around a raw memory buffer, providing some common functionality like resizing and CoW
/// support.
///
/// - Attention: Unless noted otherwise, it is the client's responsibility to initialize and
///              destroy elements in the buffer. One exception being the `count` elements
///              remaining in the buffer when it is no longer referenced which will be
///              destroyed automatically when the buffer is deallocated.
/// - Attention: Elements **must** be stored sequentially starting at `elements`.
/// - Attention: `count` **must** be maintained by the client to accurately reflect the number of
///              initialized elements in the buffer.
internal struct ArrayBuffer<Element> {
    private var storage: ArrayBufferStorage<Element>

    
    /// The capacity of this buffer.
    var capacity: Int {
        return storage.capacity
    }
    
    /// The number of elements that the buffer stores.
    ///
    /// Use this to store the number of currently initialized elements.
    /// It is important that this number is accurate as it will be used to determine how many
    /// elements still need to be destroyed when the buffer is deallocated.
    var count: Int {
        get { return storage.count }
        set { storage.count = newValue }
    }

    /// A pointer to the memory buffer. Use this to create and destroy elements.
    ///
    /// - Attention: Do not store this pointer seperately. `reserveCapacity()`, `removeAll()`
    ///              and `ensureHoldsUniqueReference()` will invalidate this pointer.
    /// - Todo: Switch to using `withUnsafeMutablePointer()` once that no longer has a performance
    ///         penalty in certain cases.
    var elements: UnsafeMutablePointer<Element> {
        return storage.elements
    }
    
    /// Create an empty `ArrayBuffer` that can store at least `minimumCapacity` elements.
    init(minimumCapacity: Int = 0) {
        storage = ArrayBufferStorage()
        reserveCapacity(minimumCapacity)
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
            storage = ArrayBufferStorage(capacity: capacity, sourceBuffer: storage)
        }
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
            let newCapacity = nextPoW2(minimumCapacity)
            // If we hold the only reference to managedBuffer, we can safely destroy the elements
            // during the copy process.
            if holdsUniqueReference() {
                // Allocate a new buffer
                let elements = UnsafeMutablePointer<Element>.alloc(newCapacity)
                
                // Copy the contents to the new buffer
                // Destroy the old buffer in the process if we hold the only reference
                elements.moveInitializeFrom(storage.elements, count: count)
                storage.elements.dealloc(capacity)
                
                storage.elements = elements
                storage.capacity = newCapacity
            } else {
                storage = ArrayBufferStorage(capacity: newCapacity, sourceBuffer: storage)
            }
        }
    }

    /// Remove all elements stored in this buffer.
    ///
    /// This will destroy the `count` elements stored in this buffer while maintaining CoW
    /// semantics.
    ///
    /// - Parameter `keepCapacity`: If true, is a non-binding request to avoid releasing storage, which
    ///                         can be a useful optimization when self is going to be grown again.
    /// - Complexity: O(`count`)
    /// - Precondition: The buffer holds `count` initialized elements.
    /// - Postcondition: `count == 0 && holdsUniqueReference() == true`
    /// - Note: Do not destroy the elements before calling this function as they will be destroyed
    ///         automatically.
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        if holdsUniqueReference() {
            // Destroy the elements
            elements.destroy(count)
            count = 0
            
            if (!keepCapacity) {
                elements.dealloc(capacity)
                storage.capacity = 0
                storage.elements = nil
            }
        } else {
            // Create new empty storage
            let currentCapacity = capacity
            
            storage = ArrayBufferStorage()
            if (keepCapacity) {
                reserveCapacity(currentCapacity)
            }
        }
    }
}

