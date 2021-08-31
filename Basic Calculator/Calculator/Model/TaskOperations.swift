//
//  TaskOperations.swift
//  Basic Calculator
//
//  Created by Tariq on 31/08/2021.
//

import Foundation

struct TaskOperations {
    
    static let operations = ["+", "-", "*", "/"]
    
    static var delayTimes: [Int] {
        var times = [Int]()
        for item in 0 ... 60{
            if item % 5 == 0{
                times.append(item)
            }
        }
        return times
    }
}
