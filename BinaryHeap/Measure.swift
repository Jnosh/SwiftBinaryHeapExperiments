//
//  Measure.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 14/02/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Chronos
// import Framework

struct Measurement {
    let name: String
    
    let insert: Duration
    let remove: Duration

    var total: Duration {
        return insert + remove
    }
}

func printResult(base base: Measurement, measured: Measurement) {
    print(measured.name)

    let insertRatio = NSString(format: "%.2f", base.insert.seconds / measured.insert.seconds)
    let removeRatio = NSString(format: "%.2f", base.remove.seconds / measured.remove.seconds)
    let totalRatio = NSString(format: "%.2f", base.total.seconds / measured.total.seconds)

    print("Insert: \(insertRatio) (\(measured.insert.description))")
    print("Remove: \(removeRatio) (\(measured.remove.description))")
    print("Total:  \(totalRatio) (\(measured.total.description))")
    print("")
}


func timeHeap<Heap : BinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, elements: [Element]) -> Measurement {
    var heap = heapType.init()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    return Measurement(name: String(heapType), insert: insertTime, remove: removeTime)
}

func timeCFHeap<E: CFComparable>(elements: [E]) -> Measurement {
    var heap = BinaryHeapCF<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while !heap.isEmpty {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    return Measurement(name: String(BinaryHeapCF<E>.self), insert: insertTime, remove: removeTime)
}



/*
func timeFrameworkHeap<Heap : Framework.BinaryHeapType, Element : Comparable where Heap.Element == Element>(heapType: Heap.Type, elements: [Element]) -> Measurement {
var heap = heapType.init()

// Add the elements
let sw1 = Stopwatch()
for element in elements {
heap.insert(element)
}
let insertTime = sw1.elapsed()

// Retrieve the elements in order
let sw2 = Stopwatch()
while !heap.isEmpty {
heap.removeFirst()
}
let removeTime = sw2.elapsed()

return Measurement(name: String(heapType), insert: insertTime, remove: removeTime)
}


func timeFrameworkCFHeap<E: Framework.CFComparable>(elements: [E]) -> Measurement {
    var heap = Framework.BinaryHeapCF<E>()

    // Add the elements
    let sw1 = Stopwatch()
    for element in elements {
        heap.insert(element)
    }
    let insertTime = sw1.elapsed()

    // Retrieve the elements in order
    let sw2 = Stopwatch()
    while heap.count != 0 {
        heap.removeFirst()
    }
    let removeTime = sw2.elapsed()

    return Measurement(name: String(Framework.BinaryHeapCF<E>.self), insert: insertTime, remove: removeTime)
}

*/


