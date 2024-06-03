//
//  File.swift
//  
//
//  Created by Manjil Rajbhandari on 03/06/2024.
//

import Foundation

struct QueueArray<T>: Queue {
    private var array: [T] = []
    public init() {}
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var peek: T? {
        array.first
    }
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : array.removeFirst()
    }
 }


extension QueueArray: CustomStringConvertible {
    var description: String {
        array.description
    }
}


struct QueueArrayOperation: Operation {
    func perform() {
        operation()
    }
    
    private func operation() {
        example(of: "QueueArray") {
            var queue = QueueArray<String>()
            queue.enqueue("Ray")
            queue.enqueue("Brian")
            queue.enqueue("Eric")
            print(queue.dequeue())
            print(queue)
            print(queue.peek)
        }
    }
    
    
}
