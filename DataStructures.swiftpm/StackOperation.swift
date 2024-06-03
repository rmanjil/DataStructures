//
//  StackOperation.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 03/06/2024.
//

import Foundation

struct StackOperation: Operation {
    func perform() {
        example(of: "Stack Operation") {
            operation()
        }
    }
    
   private func operation() {
        example(of: "using stack") {
            var stack = Stack<Int>()
            stack.push(1)
            stack.push(2)
            stack.push(3)
            stack.push(4)
            stack.push(5)
            
            print(stack)
            
            if let poppedElement = stack.pop() {
                assert(5 == poppedElement)
                print("Popped: \(poppedElement)")
            }
        }
       
       example(of: "initializing a stack from an array") {
         let array = ["A", "B", "C", "D"]
         var stack = Stack(array)
         print(stack)
         stack.pop()
       }
    }
}
