//
//  NonGenericHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 22/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

public struct SmallValueElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<ValueElementSmall>

    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> ValueElementSmall? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ValueElementSmall? {
        return heap.first
    }
    
    public mutating func insert(value: ValueElementSmall) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValueElementSmall {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct MediumValueElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<ValueElementMedium>

    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> ValueElementMedium? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }

    public var count: Int {
        return heap.count
    }
    
    public var first: ValueElementMedium? {
        return heap.first
    }
    
    public mutating func insert(value: ValueElementMedium) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValueElementMedium {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct LargeValueElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<ValueElementLarge>

    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> ValueElementLarge? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ValueElementLarge? {
        return heap.first
    }
    
    public mutating func insert(value: ValueElementLarge) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValueElementLarge {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct ReferenceElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<ReferenceElement>
    
    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> ReferenceElement? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ReferenceElement? {
        return heap.first
    }
    
    public mutating func insert(value: ReferenceElement) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ReferenceElement {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct PointerReferenceElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<PointerElement<ReferenceElement>>
    
    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> PointerElement<ReferenceElement>? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: PointerElement<ReferenceElement>? {
        return heap.first
    }
    
    public mutating func insert(value: PointerElement<ReferenceElement>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> PointerElement<ReferenceElement> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct PointerValueElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<PointerElement<ValueElementLarge>>
    
    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> PointerElement<ValueElementLarge>? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }

    public var count: Int {
        return heap.count
    }
    
    public var first: PointerElement<ValueElementLarge>? {
        return heap.first
    }
    
    public mutating func insert(value: PointerElement<ValueElementLarge>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> PointerElement<ValueElementLarge> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct UnmanagedElementHeap : BinaryHeapType {
    private var heap: UnsafePointerHeap<UnmanagedElement<ReferenceElement>>
    
    public init() {
        heap = UnsafePointerHeap()
    }

    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }

    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> UnmanagedElement<ReferenceElement>? {
        if isEmpty { return nil }

        return removeFirst()
    }

    public func underestimateCount() -> Int {
        return count
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: UnmanagedElement<ReferenceElement>? {
        return heap.first
    }
    
    public mutating func insert(value: UnmanagedElement<ReferenceElement>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> UnmanagedElement<ReferenceElement> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

