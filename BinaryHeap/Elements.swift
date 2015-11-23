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
    let refElements: [RefElement]

    let smallValElements: [ValElementSmall]
    let mediumValElements: [ValElementMedium]
    let largeValElements: [ValElementLarge]

    let ptrRefElements: [PtrElement<RefElement>]
    let ptrValElements: [PtrElement<ValElementLarge>]

    let unmanagedElements: [UnmanagedElement<RefElement>]
    
    
    let frameworkRefElements: [Framework.RefElement]
    
    let frameworkSmallValElements: [Framework.ValElementSmall]
    let frameworkMediumValElements: [Framework.ValElementMedium]
    let frameworkLargeValElements: [Framework.ValElementLarge]
    
    let frameworkPtrRefElements: [Framework.PtrElement<Framework.RefElement>]
    let frameworkPtrValElements: [Framework.PtrElement<Framework.ValElementLarge>]
    
    let frameworkUnmanagedElements: [Framework.UnmanagedElement<Framework.RefElement>]
    
    init(count: Int) {
        // Generate nodes
        refElements = (0..<count).map { _ in RefElement(random()) }

        smallValElements = refElements.map { ValElementSmall($0.value) }
        mediumValElements = refElements.map { ValElementMedium($0.value) }
        largeValElements = refElements.map { ValElementLarge($0.value) }

        ptrRefElements = refElements.map { PtrElement($0) }
        ptrValElements = largeValElements.map { PtrElement($0) }

        unmanagedElements = refElements.map { UnmanagedElement($0) }
        
        
        frameworkRefElements = refElements.map { Framework.RefElement($0.value) }
        
        frameworkSmallValElements = refElements.map { Framework.ValElementSmall($0.value) }
        frameworkMediumValElements = refElements.map { Framework.ValElementMedium($0.value) }
        frameworkLargeValElements = refElements.map { Framework.ValElementLarge($0.value) }
        
        frameworkPtrRefElements = frameworkRefElements.map { Framework.PtrElement($0) }
        frameworkPtrValElements = frameworkLargeValElements.map { Framework.PtrElement($0) }
        
        frameworkUnmanagedElements = frameworkRefElements.map { Framework.UnmanagedElement($0) }
    }

    deinit {
        ptrRefElements.forEach { $0.destroy() }
        ptrValElements.forEach { $0.destroy() }
        unmanagedElements.forEach { $0.destroy() }
    }
}
