//
//  BinaryHeapType.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 16/09/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// A binary heap is a heap data structure created using a binary tree.
/// It can be seen as a binary tree with two additional constraints:
///
/// **Shape property:**
///     A binary heap is a complete binary tree; that is, all levels of the tree,
///     except possibly the last one (deepest) are fully filled, and, if the last level
///     of the tree is not complete, the nodes of that level are filled from left to right.
///
/// **Heap property:**
///     All nodes are either greater than or equal to or less than or equal to each of its children,
///     according to a comparison predicate defined for the heap.
///
/// **See also:**
///     [Wikipedia](https://en.wikipedia.org/wiki/Binary_heap)
public protocol _BinaryHeapType  {
    // FIXME: SequenceType -> http://www.openradar.me/22720220 & http://www.openradar.me/22720512

    typealias Element

    /// The number of values contained in this heap
    var count: Int { get }

    /// The smallest element on the heap as ordered by the comparison function or nil if the heap is empty.
    var first: Element? { get }

    /// Insert a new element into the heap.
    mutating func insert(element: Element)

    /// Remove the root element (the smallest element) from the heap and return it.
    mutating func removeFirst() -> Element

    /// Remove all elements.
    mutating func removeAll(keepCapacity keepCapacity: Bool)
    
    // Supported by all except CFBinaryHeapWrapper
    // var capacity: Int { get }
    // mutating func reserveCapacity(minimumCapacity: Int)
}

// Default implementations
extension _BinaryHeapType {
    /// Returns true iff `self` is empty.
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// If `!self.isEmpty`, remove the first element and return it, otherwise return `nil`.
    public mutating func popFirst() -> Element? {
        guard !isEmpty else { return nil }
        
        return removeFirst()
    }
    
    public func underestimateCount() -> Int {
        return count
    }
    
    public func generate() -> BinaryHeapGenerator<Self> {
        return BinaryHeapGenerator(heap: self)
    }
}

extension _BinaryHeapType {
    public var debugDescription: String {
        return binaryHeapDescription(self)
    }

    public var description: String {
        return binaryHeapDescription(self)
    }
}

public protocol BinaryHeapType : _BinaryHeapType {
    /// Initialize an empty heap
    init()
}

public protocol ClosureBinaryHeapType : _BinaryHeapType {
    // Alternatively, could use closure for comparsion instead of Comparable
    //
    // we'd like to have both versions i.e. init with comparable element or with comparison func
    // however this is hard to really support "well" in the same protocol/type
    //
    // We cannot easily build closure variant based on Comparable variant
    // and while doing the reverse is pretty easy, it is slower in many cases than doing
    // 'native' Comparable-based implementations
    //
    // And "specializing" for each case at compile time isn't really possible in Swift
    // i.e. specialized generics
    init(isOrderedBefore: (Element, Element) -> Bool)
}

extension ClosureBinaryHeapType where Element : Comparable {
    init() {
        self.init(isOrderedBefore: <)
    }
}

/// Extension to BinaryHeapType that offers alternative (unsafe) insertion and removal methods
/// to work around current optimizer limitations.
public protocol BinaryHeapType_Fast : BinaryHeapType {
    mutating func fastInsert(element: Element)
    mutating func fastRemoveFirst() -> Element
}

/// Basic generator that works with all `BinaryHeapType`s.
public struct BinaryHeapGenerator<BinaryHeap : _BinaryHeapType> : GeneratorType {
    private var heap: BinaryHeap

    public init(heap: BinaryHeap) {
        self.heap = heap
    }

    public mutating func next() -> BinaryHeap.Element? {
        guard !heap.isEmpty else { return nil }

        return heap.removeFirst()
    }
}
