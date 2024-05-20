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
    
    @discardableResult
    mutating func remove(after node: Node<Value>) -> Value? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
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

extension LinkedList: Collection {
        
    public struct Index: Comparable {
        var node: Node<Value>?
        
        static func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let( left?, right?):
                left.next === right.next
            case (nil, nil):
                true
            default:
                false
            }
        }
        
        static func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains(where: { $0 === rhs.node })
        }
    }
    
    
    var startIndex: Index {
        Index(node: head)
    }
    
    var endIndex: Index {
        Index(node: tail?.next)
    }
    
    func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    subscript(position: Index) -> Value {
        position.node!.value
    }
}

// copy on write
extension LinkedList {
    
    private mutating func copyNodes() {
        guard var oldNode = head else {
            return
        }
        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode?.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
    
    
    /// add value at the front of list
    mutating func pushCOW(_ value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    /// add value at the end of list
    mutating func appendCOW(_ value: Value) {
        copyNodes()
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = Node(value: value)
        tail = tail?.next
    }
    
    @discardableResult
    mutating func insertCOW(_ value: Value, after node: Node<Value>) -> Node<Value> {
        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    /// remove value at the front of list
    @discardableResult
    mutating func popCOW() -> Value? {
        copyNodes()
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
    mutating func removeLastCOW() -> Value? {
        copyNodes()
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
    
    @discardableResult
    mutating func removeCOW(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
}
