//
//  ArrayBuffer.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 13/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Storage class backing `ArrayBuffer` used to implement CoW behaviour.
///
/// - Todo: Should ideally have a second generic parameter for extra storage elements.
///         Use that to add `isOrderedBefore` or () in the default case.
///         But optimizer is a unhappy with that much genericity, producing measurably slower code.
///         Might also be useful for `retainElementsOnCopy` to replace with a generic copy-callback.
private final class ArrayBufferStorage<Element> {
    /// The pointer to the elements.
    private var elements: UnsafeMutablePointer<Element>
    /// The capacity of `elements`.
    private var capacity: Int
    /// The number of elements that the buffer stores.
    private var count: Int

    /// Optional closure for comparisons.
    private let isOrderedBefore: ((Element, Element) -> Bool)?

    /// Do we need to retain the elements when they are copied?
    ///
    /// This is a hack to support ClassElementHeap.
    private let retainElementsOnCopy: Bool

    private init(retainElementsOnCopy: Bool = false, isOrderedBefore: ((Element, Element) -> Bool)? = nil) {
        elements = nil
        count = 0
        capacity = 0
        self.isOrderedBefore = isOrderedBefore
        self.retainElementsOnCopy = retainElementsOnCopy
    }

    private init(capacity: Int, sourceBuffer buffer: ArrayBufferStorage<Element>, destroySourceContents: Bool = false) {
        // Allocate a new buffer
        elements = UnsafeMutablePointer<Element>.alloc(capacity)
        count = buffer.count
        self.capacity = capacity
        isOrderedBefore = buffer.isOrderedBefore
        retainElementsOnCopy = buffer.retainElementsOnCopy

        // Copy the contents to the new buffer, destroying the contents of buffer if
        // destroySourceContents is set
        if destroySourceContents {
            elements.moveInitializeFrom(buffer.elements, count: count)
            buffer.count = 0
        } else {
            if (retainElementsOnCopy) {
                // HACK: Treat the elements as AnyObjects and retain them
                for ptr in stride(from: elements, to: elements.advancedBy(count), by: 1) {
                    unsafeBitCast(ptr, UnsafePointer<Unmanaged<AnyObject>>.self).memory.retain()
                }
            }

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

    /// The optional comparison closure.
    ///
    /// - Warning: Accessing the closure when it has not been set during initilization will result
    ///            in a runtime error.
    var isOrderedBefore: (Element, Element) -> Bool {
        return storage.isOrderedBefore!
    }

    /// Create an empty `ArrayBuffer` that can store at least `minimumCapacity` elements.
    init(minimumCapacity: Int = 0, retainElementsOnCopy: Bool = false, isOrderedBefore: ((Element, Element) -> Bool)? = nil) {
        storage = ArrayBufferStorage(retainElementsOnCopy: retainElementsOnCopy, isOrderedBefore: isOrderedBefore)
        reserveCapacity(minimumCapacity)
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
            storage = ArrayBufferStorage(capacity: minimumCapacity, sourceBuffer: storage)
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
    ///                         can be a useful optimization when self is going to be grown again.
    /// - Complexity: O(`count`)
    /// - Precondition: The buffer holds `count` initialized elements.
    /// - Postcondition: `count == 0 && holdsUniqueReference() == true`
    /// - Note: Do not destroy the elements before calling this function as they will be destroyed
    ///         automatically.
    mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        // Create new empty storage
        let currentCapacity = capacity
        
        storage = ArrayBufferStorage(retainElementsOnCopy: storage.retainElementsOnCopy,
                                    isOrderedBefore: storage.isOrderedBefore)
        if (keepCapacity) {
            reserveCapacity(currentCapacity)
        }
    }
}

