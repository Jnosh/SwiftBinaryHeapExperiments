//
//  Elements.swift
//  BinaryHeap
//
//  Created by Janosch Hildebrand on 25/10/15.
//  Copyright © 2015 Janosch Hildebrand. All rights reserved.
//

import Framework

/// Container that contains element collections for a test run
class ElementContainer {
    let refElements: [ReferenceElement]

    let smallValueElements: [ValueElementSmall]
    let mediumValueElements: [ValueElementMedium]
    let largeValueElements: [ValueElementLarge]

    let pointerReferenceElements: [PointerElement<ReferenceElement>]
    let pointerValueElements: [PointerElement<ValueElementLarge>]

    let unmanagedElements: [UnmanagedElement<ReferenceElement>]
    
    
    let frameworkReferenceElements: [Framework.ReferenceElement]
    
    let frameworkSmallValueElements: [Framework.ValueElementSmall]
    let frameworkMediumValueElements: [Framework.ValueElementMedium]
    let frameworkLargeValueElements: [Framework.ValueElementLarge]
    
    let frameworkPointerReferenceElements: [Framework.PointerElement<Framework.ReferenceElement>]
    let frameworkPointerValueElements: [Framework.PointerElement<Framework.ValueElementLarge>]
    
    let frameworkUnmanagedElements: [Framework.UnmanagedElement<Framework.ReferenceElement>]
    
    init(count: Int) {
        // Generate nodes
        refElements = (0..<count).map { _ in ReferenceElement(random()) }

        smallValueElements = refElements.map { ValueElementSmall($0.value) }
        mediumValueElements = refElements.map { ValueElementMedium($0.value) }
        largeValueElements = refElements.map { ValueElementLarge($0.value) }

        pointerReferenceElements = refElements.map { PointerElement($0) }
        pointerValueElements = largeValueElements.map { PointerElement($0) }

        unmanagedElements = refElements.map { UnmanagedElement($0) }
        
        
        frameworkReferenceElements = refElements.map { Framework.ReferenceElement($0.value) }
        
        frameworkSmallValueElements = refElements.map { Framework.ValueElementSmall($0.value) }
        frameworkMediumValueElements = refElements.map { Framework.ValueElementMedium($0.value) }
        frameworkLargeValueElements = refElements.map { Framework.ValueElementLarge($0.value) }
        
        frameworkPointerReferenceElements = frameworkReferenceElements.map { Framework.PointerElement($0) }
        frameworkPointerValueElements = frameworkLargeValueElements.map { Framework.PointerElement($0) }
        
        frameworkUnmanagedElements = frameworkReferenceElements.map { Framework.UnmanagedElement($0) }
    }

    deinit {
        pointerReferenceElements.forEach { $0.destroy() }
        pointerValueElements.forEach { $0.destroy() }
        unmanagedElements.forEach { $0.destroy() }
    }
}
