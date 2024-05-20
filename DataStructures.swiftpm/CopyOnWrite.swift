//
//  CopyOnWrite.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 20/05/2024.
//

import Foundation

struct CopyOnWrite {
    func perform() {
        copyOnWriteInArray()
        copyOnWriteInLinkedList()
        checkKnownUniquelyReferenced()
    }
    
    private func copyOnWriteInArray() {
        example(of: "array cow") {
            let array1 = [1, 2]
            var array2 = array1
            
            print("array1: \(array1)")
            print("array2: \(array2)")
            print("---After adding 3 to array 2---")
            array2.append(3)
            print("array1: \(array1)")
            print("array2: \(array2)")
        }
    }
    
    private func copyOnWriteInLinkedList()  {
        example(of: "Linked List cant use COW") {
            var list1 = LinkedList<Int>()
            list1.append(1)
            list1.append(2)
            var list2 = list1
            print("list1: \(list1)")
            print("list2: \(list2)")
            print("---After adding 3 to list 2---")
            list2.append(3)
            print("list1: \(list1)")
            print("list2: \(list2)")
        }
        
        example(of: "Linked List COW") {
            var list1 = LinkedList<Int>()
            list1.appendCOW(1)
            list1.appendCOW(2)
            var list2 = list1
            print("list1: \(list1)")
            print("list2: \(list2)")
            print("---After adding 3 to list 2---")
            list2.appendCOW(3)
            print("list1: \(list1)")
            print("list2: \(list2)")
        }
    }
    
    private func checkKnownUniquelyReferenced() {
        example(of: "checkKnownUniquelyReferenced") {
            var list1 = LinkedList<Int>()
            list1.append(1)
            list1.append(2)
            print("List1 Uniquely Referenced: \(isKnownUniquelyReferenced(&list1.head))")
            var list2 = list1
            print("List1 Uniquely Referenced: \(isKnownUniquelyReferenced(&list1.head))")
        }
    }

}
