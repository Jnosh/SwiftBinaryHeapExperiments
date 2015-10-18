//
//  CFBinaryHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 05/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation

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

private final class CFBinaryHeapStorage {
    private var heap: CFBinaryHeap

    private init(heap: CFBinaryHeap) {
        self.heap = heap
    }
}


@objc public protocol CFComparable {
    func compare(other: AnyObject) -> CFComparisonResult
}

public struct BinaryHeapCF<Element: CFComparable> {
    private var storage: CFBinaryHeapStorage

    public init() {
        var callbacks = CFBinaryHeapCallBacks(version: 0,
            retain: retainCallback,
            release: releaseCallback,
            copyDescription: nil,
            compare: compareCallback)

        let heap = CFBinaryHeapCreate(kCFAllocatorDefault, 0, &callbacks, nil)

        storage = CFBinaryHeapStorage(heap: heap)
    }

    private mutating func ensureUniquelyReferenced() -> Void {
        if !isUniquelyReferencedNonObjC(&storage) {
            let copy = CFBinaryHeapCreateCopy(kCFAllocatorDefault, 0, storage.heap)
            storage = CFBinaryHeapStorage(heap: copy)
        }
    }

    public var count: Int {
        return Int(CFBinaryHeapGetCount(storage.heap))
    }

    public var isEmpty: Bool {
        return count == 0
    }

    public var first: Element? {
        guard count > 0 else { return nil }

        let ptr = COpaquePointer(CFBinaryHeapGetMinimum(storage.heap))
        let value = Unmanaged<CFComparable>.fromOpaque(ptr).takeUnretainedValue()

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
        return unsafeDowncast(value)
    }

    public mutating func popFirst() -> Element? {
        guard !isEmpty else { return nil }

        return removeFirst()
    }

    public mutating func removeAll(keepCapacity: Bool = false) {
        ensureUniquelyReferenced()
        CFBinaryHeapRemoveAllValues(storage.heap)
    }
}

