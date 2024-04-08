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
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /// remove value at the front of list
    @discardableResult
    mutating func pop() -> Value? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    /// remove last node for list
    @discardableResult
    mutating func removeLast() -> Value? {
        guard let head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
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


func insert() {
    example(of: "inserting at a particular index") {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        
        print("before inserting: \(list)")
        var middleNode = list.node(at: 1)!
        for _ in 1...4 {
            middleNode = list.insert(-1, after: middleNode)
        }
        print("After inserting: \(list)")
    }
}

func pop() {
    example(of: "pop") {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before popping list: \(list)")
        let poppedValue = list.pop()
        print("After popping list: \(list)")
        print("Popped value " + String(describing: poppedValue))
    }
}

func removeLast() {
    example(of: "removing the last node") {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before remove last node: \(list)")
        let poppedValue = list.removeLast()
        print("After removing last list: \(list)")
        print("removed value " + String(describing: poppedValue))
    }
}
