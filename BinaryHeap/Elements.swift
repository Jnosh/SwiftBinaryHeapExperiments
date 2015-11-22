//
//  Elements.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

/// Container that contains element collections for a test run
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
        for el in ptrRefElements {
            el.destroy()
        }
        for el in ptrValElements {
            el.destroy()
        }
        for el in unmanagedElements {
            el.destroy()
        }
    }
}
