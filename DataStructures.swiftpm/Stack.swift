//
//  Stack.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 20/05/2024.
//

import Foundation

struct Stack<Element> {
    private var storage: [Element] = []
    init() {}
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        storage.popLast()
    }
}


extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "----top----\n"
        let bottomDivider = "\n-------------"
        
        let stackElements = storage.map { "\($0)" }.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}
