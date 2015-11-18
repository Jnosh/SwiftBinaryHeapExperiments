//
//  CFBinaryHeapWrapper.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

// MARK: CFComparable

/// Comparable for @objc-land
@objc public protocol CFComparable {
    /// Compare `self` to `other`.
    func compare(other: AnyObject) -> CFComparisonResult
}

// MARK: Callbacks

private func retainCallback(allocator: CFAllocator!, pointer: UnsafePointer<Void>) -> UnsafePointer<Void> {
    let opaque = COpaquePointer(pointer)
    let unmanaged = Unmanaged<AnyObject>.fromOpaque(opaque)
    unmanaged.retain()

    return pointer
}

private func releaseCallback(allocator: CFAllocator!, pointer: UnsafePointer<Void>) {
    let opaque = COpaquePointer(pointer)
    let unmanaged = Unmanaged<AnyObject>.fromOpaque(opaque)
    unmanaged.release()
}

private func compareCallback(lhsPtr: UnsafePointer<Void>, rhsPtr: UnsafePointer<Void>, context: UnsafeMutablePointer<Void>) -> CFComparisonResult {
    let opaqueLhs = COpaquePointer(lhsPtr)
    let unmanagedLhs = Unmanaged<CFComparable>.fromOpaque(opaqueLhs)
    let lhs = unmanagedLhs.takeUnretainedValue()

    let opaqueRhs = COpaquePointer(rhsPtr)
    let unmanagedRhs = Unmanaged<CFComparable>.fromOpaque(opaqueRhs)
    let rhs = unmanagedRhs.takeUnretainedValue()

    return lhs.compare(rhs)
}

// MARK: Wrapper

/// Internal wrapper around CFBinaryHeap to enable CoW support
private final class CFBinaryHeapStorage {
    var heap: CFBinaryHeap

    init() {
        var callbacks = CFBinaryHeapCallBacks(version: 0,
            retain: retainCallback,
            release: releaseCallback,
            copyDescription: nil,
            compare: compareCallback)
        
        heap = CFBinaryHeapCreate(kCFAllocatorDefault, 0, &callbacks, nil)
    }
    
    init(copy: CFBinaryHeapStorage) {
        self.heap = CFBinaryHeapCreateCopy(kCFAllocatorDefault, 0, copy.heap)
    }
}

/// Generic Swift wrapper for CFBinaryHeap with CoW support
public struct CFBinaryHeapWrapper<Element: CFComparable> : BinaryHeapType {
    private var storage: CFBinaryHeapStorage

    public init() {
        storage = CFBinaryHeapStorage()
    }

    private mutating func ensureUniquelyReferenced() -> Void {
        if !isUniquelyReferencedNonObjC(&storage) {
            storage = CFBinaryHeapStorage(copy: storage)
        }
    }

    public var count: Int {
        return Int(CFBinaryHeapGetCount(storage.heap))
    }

    public var first: Element? {
        guard count > 0 else { return nil }

        let ptr = COpaquePointer(CFBinaryHeapGetMinimum(storage.heap))
        let value = Unmanaged<CFComparable>.fromOpaque(ptr).takeUnretainedValue()

        // Safe as we can only insert Elements and typechecking every element is somewhat expensive
        return unsafeDowncast(value) as Element
    }

    public mutating func insert(element: Element) {
        ensureUniquelyReferenced()
        CFBinaryHeapAddValue(storage.heap, unsafeAddressOf(element))
    }

    public mutating func removeFirst() -> Element {
        precondition(count != 0, "Heap may not be empty.")
        ensureUniquelyReferenced()

        let ptr = COpaquePointer(CFBinaryHeapGetMinimum(storage.heap))
        CFBinaryHeapRemoveMinimumValue(storage.heap)

        let value = Unmanaged<CFComparable>.fromOpaque(ptr).takeUnretainedValue()
        // Safe as we can only insert Elements and typechecking every element is somewhat expensive
        return unsafeDowncast(value)
    }

    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        ensureUniquelyReferenced()
        CFBinaryHeapRemoveAllValues(storage.heap)
    }
}

extension CFBinaryHeapWrapper : CustomStringConvertible, CustomDebugStringConvertible { }

