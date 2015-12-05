//
//  MeasurementCollection.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 18/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Chronos

struct DurationList {
    private var runtimes: [Duration] = []

    mutating func addDuration(duration: Duration) {
        runtimes.append(duration)
    }

    var min: Duration {
        return minElement(runtimes)
    }

    var max: Duration {
        return maxElement(runtimes)
    }

    var mean: Duration {
        let total = runtimes.reduce(0) { return $0 + $1.nanoseconds }
        return Duration(nanoseconds: total / Double(runtimes.count))
    }

    var median: Duration {
        let sorted = runtimes.sorted(<)
        return sorted[sorted.count / 2]
    }

    var stddev: Duration {
        let mean = self.mean

        // Split up to reduce compile time
        let differences: [Double] = runtimes.map { $0.nanoseconds - mean.nanoseconds }
        let squared: [Double] = differences.map { $0 * $0 }
        let variance: Double = squared.reduce(0, combine: +) / Double(runtimes.count)

        return Duration(nanoseconds: sqrt(variance))
    }
}

struct Measurement {
    var inserts = DurationList()
    var removes = DurationList()
    var totals = DurationList()

    mutating func addMeasurement(insert: Duration, remove: Duration) {
        inserts.addDuration(insert)
        removes.addDuration(remove)
        totals.addDuration(insert + remove)
    }
}

final class MeasurementGroup {
    let name: String
    var resultSets: [String : Measurement] = [:]

    init(name: String) {
        self.name = name
    }

    subscript(resultSet: String) -> Measurement {
        get {
            return resultSets[resultSet] ?? Measurement()
        }
        set {
            resultSets[resultSet] = newValue
        }
    }
}

/// Container to accumulate measurements
class MeasurementContainer {
    let refMeasurements = MeasurementGroup(name: "ReferenceElement")
    let smallValueMeasurements = MeasurementGroup(name: "ValElement Small")
    let medValueMeasurements = MeasurementGroup(name: "ValElement Medium")
    let largeValueMeasurements = MeasurementGroup(name: "ValElement Large")
    let ptrRefMeasurements = MeasurementGroup(name: "PointerElement Ref")
    let ptrValMeasurements = MeasurementGroup(name: "PointerElement Val")
    let unmanagedMeasurements = MeasurementGroup(name: "UnmanagedElement")

    let allMeasurements: [MeasurementGroup]

    init() {
        allMeasurements = [refMeasurements, smallValueMeasurements, medValueMeasurements, largeValueMeasurements, ptrRefMeasurements, ptrValMeasurements, unmanagedMeasurements]
    }
}


