//
//  Example.swift
//  DataStructures
//
//  Created by Manjil Rajbhandari on 08/04/2024.
//

import Foundation

func example(of message: String, completion: (() -> Void)) {
    print(message)
    completion() 
}
