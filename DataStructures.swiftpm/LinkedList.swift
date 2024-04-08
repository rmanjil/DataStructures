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
    
    /// add value at the front of list
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// add value at the end of list
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
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

func push() {
    example(of: "push") {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        print(list)
    }
}

func append() {
    example(of: "append") {
        var list = LinkedList<Int>()
        list.append(1)
        list.append(2)
        list.append(3)
        
        print(list)
    }
}
