//
//  TestDataContainers.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

class ElementContainer {
    let refElements: [RefElement]

    let smallValElements: [ValElementSmall]
    let mediumValElements: [ValElementMedium]
    let largeValElements: [ValElementLarge]

    let ptrRefElements: [PtrElement<RefElement>]
    let ptrValElements: [PtrElement<ValElementLarge>]

    let unmanagedElements: [UnmanagedElement<RefElement>]

    init(count: Int) {
        // Generate nodes
        refElements = (0..<count).map { _ in RefElement() }

        smallValElements = (0..<count).map { _ in ValElementSmall() }
        mediumValElements = (0..<count).map { _ in ValElementMedium() }
        largeValElements = (0..<count).map { _ in ValElementLarge() }

        ptrRefElements = refElements.map { PtrElement($0) }
        ptrValElements = largeValElements.map { PtrElement($0) }

        unmanagedElements = refElements.map { UnmanagedElement($0) }
    }

    deinit {
        ptrRefElements.forEach { $0.destroy() }
        ptrValElements.forEach { $0.destroy() }
        unmanagedElements.forEach { $0.destroy() }
    }
}


class ResultContainer {
    let refResults = ResultSetGroup(name: "RefElement")
    let smallValResults = ResultSetGroup(name: "ValElement Small")
    let medValResults = ResultSetGroup(name: "ValElement Medium")
    let largeValResults = ResultSetGroup(name: "ValElement Large")
    let ptrRefResults = ResultSetGroup(name: "PtrElement Ref")
    let ptrValResults = ResultSetGroup(name: "PtrElement Val")
    let unmanagedResults = ResultSetGroup(name: "UnmanagedElement")

    let allResultGroups: [ResultSetGroup]

    init() {
        allResultGroups = [refResults, smallValResults, medValResults, largeValResults, ptrRefResults, ptrValResults, unmanagedResults]
    }

    func print() {
        refResults.printResults()
        smallValResults.printResults()
        medValResults.printResults()
        largeValResults.printResults()
        ptrRefResults.printResults()
        ptrValResults.printResults()
        unmanagedResults.printResults()
    }
}