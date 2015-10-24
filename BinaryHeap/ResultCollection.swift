//
//  ResultCollection.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 18/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Chronos


struct MeasurementSet {
    private var runtimes: [Duration] = []

    mutating func addMeasurement(duration: Duration) {
        runtimes.append(duration)
    }

    var min: Duration {
        return runtimes.minElement()!
    }

    var max: Duration {
        return runtimes.maxElement()!
    }

    var mean: Duration {
        let total = runtimes.reduce(0) { return $0 + $1.nanoseconds }
        return Duration(nanoseconds: total / Double(runtimes.count))
    }

    var median: Duration {
        let sorted = runtimes.sort()
        return sorted[sorted.count / 2]
    }

    var stddev: Duration {
        let mean = self.mean

        let variance = runtimes.map { $0.nanoseconds - mean.nanoseconds }
            .map { $0 * $0 }
            .reduce(0, combine: +) / Double(runtimes.count)

        return Duration(nanoseconds: sqrt(variance))
    }
}


struct ResultSet {
    let name: String

    var inserts = MeasurementSet()
    var removes = MeasurementSet()
    var totals = MeasurementSet()

    init(name: String) {
        self.name = name
    }

    mutating func addMeasurement(insert: Duration, remove: Duration) {
        inserts.addMeasurement(insert)
        removes.addMeasurement(remove)
        totals.addMeasurement(insert + remove)
    }
}

final class ResultSetGroup {
    let name: String
    private var resultSets: [String : ResultSet] = [:]

    init(name: String) {
        self.name = name
    }

    subscript(resultSet: String) -> ResultSet {
        get {
            return resultSets[resultSet] ?? ResultSet(name: resultSet)
        }
        set {
            resultSets[resultSet] = newValue
        }
    }
}



func printResult(resultGroup: ResultSetGroup) {
    let tags = ["Insert", "Remove", "Total", "σ"]

    let resultSets = Array(resultGroup.resultSets.values).sort { $0.totals.mean < $1.totals.mean }

    let maxLenght = resultGroup.resultSets.keys.reduce(0) {
        return max($1.characters.count, $0)
    }

    let name = resultGroup.name.stringByPaddingToLength(maxLenght, withString: " ", startingAtIndex: 0)
    let paddedTags = tags.map {
        String(count: 12 - $0.characters.count, repeatedValue: " " as Character) + $0
    }

    let titleRow = name + " | " + paddedTags.joinWithSeparator(" | ")
    let titleUnderline = String(count: titleRow.characters.count, repeatedValue: "-" as Character)
    print(titleRow)
    print(titleUnderline)


    for resultSet in resultSets {
        let name = resultSet.name.stringByPaddingToLength(maxLenght, withString: " ", startingAtIndex: 0)
        let insert = padDuration(resultSet.inserts.mean)
        let remove = padDuration(resultSet.removes.mean)
        let total = padDuration(resultSet.totals.mean)
        let stddev = padDuration(resultSet.totals.stddev)

        print([name, insert, remove, total, stddev].joinWithSeparator(" | "))
    }

    print(titleUnderline)
    print("")
}


func padDuration(duration: Duration) -> String {
    return String(format: "%10.4gms", duration.milliseconds)
}




