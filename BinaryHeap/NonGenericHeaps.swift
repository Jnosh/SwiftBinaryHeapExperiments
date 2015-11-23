//
//  NonGenericHeap.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 22/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

public struct SmallValueElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<ValElementSmall>

    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ValElementSmall? {
        return heap.first
    }
    
    public mutating func insert(value: ValElementSmall) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValElementSmall {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct MediumValueElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<ValElementMedium>

    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ValElementMedium? {
        return heap.first
    }
    
    public mutating func insert(value: ValElementMedium) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValElementMedium {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct LargeValueElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<ValElementLarge>

    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: ValElementLarge? {
        return heap.first
    }
    
    public mutating func insert(value: ValElementLarge) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> ValElementLarge {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct ReferenceElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<RefElement>
    
    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: RefElement? {
        return heap.first
    }
    
    public mutating func insert(value: RefElement) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> RefElement {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct PointerReferenceElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<PtrElement<RefElement>>
    
    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: PtrElement<RefElement>? {
        return heap.first
    }
    
    public mutating func insert(value: PtrElement<RefElement>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> PtrElement<RefElement> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct PointerValueElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<PtrElement<ValElementLarge>>
    
    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: PtrElement<ValElementLarge>? {
        return heap.first
    }
    
    public mutating func insert(value: PtrElement<ValElementLarge>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> PtrElement<ValElementLarge> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

public struct UnmanagedElementHeap : BinaryHeapType, CustomDebugStringConvertible, CustomStringConvertible {
    private var heap: UnsafePointerHeap<UnmanagedElement<RefElement>>
    
    public init() {
        heap = UnsafePointerHeap()
    }
    
    public var count: Int {
        return heap.count
    }
    
    public var first: UnmanagedElement<RefElement>? {
        return heap.first
    }
    
    public mutating func insert(value: UnmanagedElement<RefElement>) {
        heap.insert(value)
    }
    
    public mutating func removeFirst() -> UnmanagedElement<RefElement> {
        return heap.removeFirst()
    }
    
    public mutating func removeAll(keepCapacity keepCapacity: Bool = false) {
        heap.removeAll(keepCapacity: keepCapacity)
    }
}

