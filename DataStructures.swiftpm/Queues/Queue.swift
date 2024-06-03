//
//  Queue.swift
//
//
//  Created by Manjil Rajbhandari on 03/06/2024.
//

import Foundation

protocol Queue {
    associatedtype Element
    
    mutating func enqueue(_ element: Element) -> Bool?
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}
