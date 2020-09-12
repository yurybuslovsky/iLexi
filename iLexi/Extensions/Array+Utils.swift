//
//  Array+Utils.swift
//  iLexi
//
//  Created by Yury Buslovsky on 12.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

extension Array where Element: Equatable {

    mutating func removeUntil(_ element: Element, including: Bool) {
        var array = self
        
        while
            let lastElement = array.last,
            element != lastElement
        {
            array.removeLast()
        }
        
        if
            including,
            !array.isEmpty
        {
            array.removeLast()
        }
        
        self = array
    }
    
    mutating func removeWhileNot(_ predicate: FactoryBlock<Element, Bool>, includingNext: Bool) {
        var array = self
        
        while
            let lastElement = array.last,
            !predicate(lastElement)
        {
            array.removeLast()
        }
        
        if
            includingNext,
            !array.isEmpty
        {
            array.removeLast()
        }
        
        self = array
    }

}
