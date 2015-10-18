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
public protocol BinaryHeapType  {
    // FIXME: SequenceType -> radars 22720220 & 22720512

    typealias Element: Comparable

    /// Initialize an empty heap
    init()

    // TODO: how do we want to handle this?
    // ultimately we'd like to have both versions i.e. init with comparable element
    // or with comparison func
    //
    // Problem right now is that we cannot really easily specialize types that way
    // We can support init() with extension below based on init(isOrderedBefore:)
    // but that is *much* slower than having an implementation that relies on Comparable
    // 
    // In Comparable case compiler specializes generic type & potentially inlines comparison
    // check
    // Whereas in other case we always need to store a closure & run that which needs a bit of
    // extra memory and contents aren't really inlined so we have to pay function call overhead
    // init(isOrderedBefore: (Element, Element) -> Bool)

    /// The number of values contained in this heap
    var count: Int { get }

    /// The smallest element on the heap as ordered by the comparison function or nil if the heap is empty.
    var first: Element? { get }

    /// Insert a new element into the heap.
    mutating func insert(element: Element)

    /// Remove the root element (the smallest element) from the heap and return it
    mutating func removeFirst() -> Element

    /// Remove all elements from the heap
    mutating func removeAll(keepCapacity keepCapacity: Bool)
}


extension BinaryHeapType {
    public var isEmpty: Bool {
        return count == 0
    }
    
    public func underestimateCount() -> Int {
        return count
    }
    
    public mutating func popFirst() -> Element? {
        guard !isEmpty else { return nil }
        
        return removeFirst()
    }

    public func generate() -> BinaryHeapGenerator<Self> {
        return BinaryHeapGenerator(heap: self)
    }
}

/*
extension BinaryHeapType where Element : Comparable {
    init() {
        self.init(isOrderedBefore: <)
    }
}
*/

public struct BinaryHeapGenerator<BinaryHeap : BinaryHeapType> : GeneratorType {
    private var heap: BinaryHeap

    public init(heap: BinaryHeap) {
        self.heap = heap
    }

    public mutating func next() -> BinaryHeap.Element? {
        guard !heap.isEmpty else { return nil }

        return heap.removeFirst()
    }
}


