//
//  MeasurementPrinting.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 06/11/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Foundation
import Chronos

private let paddingCharacter: Character = " "
private let lineCharacter: Character = "-"
private let separatorString = " | "

func printMeasurementGroup(measurementGroup: MeasurementGroup) {
    let tags = ["Insert", "Remove", "Total", "σ"]

    // Sort measurements by total execution time
    let sortedMeasurements = measurementGroup.resultSets.sort() { lhs, rhs in
        lhs.1.totals.mean < rhs.1.totals.mean
    }

    // Determine the width of the name column
    let maxNameLength = measurementGroup.resultSets.keys.reduce(0) {
        max($0, $1.characters.count)
    }
    let paddedGroupName = pad(measurementGroup.name, toLength: maxNameLength)

    // Since the durations have a fixed size, we resize the tag names to fit
    let maxTagLength = formatDuration(Duration(nanoseconds: 0)).characters.count
    let paddedTags = tags.map { leftPad($0, toLength: maxTagLength) }

    // Print the title line
    let titleLine = lineForElements([paddedGroupName] + paddedTags)
    let separatorLine = separatorLineWithLength(titleLine.characters.count)
    print(titleLine)
    print(separatorLine)

    // Print the measurements
    for (name, measurementGroup) in sortedMeasurements {
        let paddedName = pad(name, toLength: maxNameLength)
        let insert = formatDuration(measurementGroup.inserts.mean)
        let remove = formatDuration(measurementGroup.removes.mean)
        let total = formatDuration(measurementGroup.totals.mean)
        let stddev = formatDuration(measurementGroup.totals.stddev)

        let line = lineForElements([paddedName, insert, remove, total, stddev])
        print(line)
    }

    print(separatorLine)
    print("")
}

private func lineForElements(elements: [String]) -> String {
    return elements.joinWithSeparator(separatorString)
}

private func separatorLineWithLength(length: Int) -> String {
    return String(count: length, repeatedValue: lineCharacter)
}

private func pad(string: String, toLength length: Int) -> String {
    return string.stringByPaddingToLength(length, withString: " ", startingAtIndex: 0)
}

private func leftPad(string: String, toLength length: Int) -> String {
    let shortenedString = String(string.characters.prefix(length))
    let padding = String(count: length - shortenedString.characters.count, repeatedValue: paddingCharacter)
    return padding + shortenedString
}

private func formatDuration(duration: Duration) -> String {
    return String(format: "%10.4gms", duration.milliseconds)
}
