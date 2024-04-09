//
//  Node.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 08/04/2024.
//

import Foundation

class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

func createNode() {
    example(of: "Create and Linking nodes") {
        let node1 = Node(value: 1)
        let node2 = Node(value: 2)
        let node3 = Node(value: 3)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }
    
}
