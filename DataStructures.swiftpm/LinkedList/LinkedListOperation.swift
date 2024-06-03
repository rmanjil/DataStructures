//
//  LinkedListOperation.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 14/05/2024.
//

import Foundation

struct LinkedListOperation: Operation {
    
    func perform()  {
        example(of: "Link List ") {
            push()
            append()
            insert()
            pop()
            removeLast()
            removedNode()
            useCollection()
        }
        
        
    }
    
    private func push() {
        example(of: "push") {
            var list = LinkedList<Int>()
            list.push(3)
            list.push(2)
            list.push(1)
            
            print(list)
        }
    }
    
    private func append() {
        example(of: "append") {
            var list = LinkedList<Int>()
            list.append(1)
            list.append(2)
            list.append(3)
            
            print(list)
        }
    }
    
    
    private func insert() {
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
    
    private func pop() {
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
    
    private func removeLast() {
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
    
    private func removedNode() {
        example(of: "removing a node after a particular node") {
            var list = LinkedList<Int>()
            list.push(3)
            list.push(2)
            list.push(1)
            
            print("Before removing at particular index: \(list)")
            let index = 1
            let node = list.node(at: index - 1)!
            let removedValue = list.remove(after: node)
            
            print("After removing at index \(index): \(list)")
            print("Removed value:" + String(describing: removedValue))
            
        }
    }
    
    private func useCollection() {
        example(of: "using collection") {
            var list = LinkedList<Int>()
            for i in 0...9 {
                list.append(i)
            }
            print("List: \(list)")
            print("First element: \(list[list.startIndex]) ")
            print("Array containing first 3 elements: \(Array(list.prefix(3)))")
            print("Array containing last 3 elements: \(Array(list.suffix(3)))")
            let sum = list.reduce(0, +)
            print("Sum of all value: \(sum)")
        }
    }
}
