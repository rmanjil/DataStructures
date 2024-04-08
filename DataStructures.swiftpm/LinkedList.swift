//
//  LinkedList.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 08/04/2024.
//

import Foundation

struct LinkedList<Value> {
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {}
    
    var isEmpty: Bool {
        head == nil
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head else {
            return "Empty Linked List"
        }
        return String(describing: head)
    }
}
