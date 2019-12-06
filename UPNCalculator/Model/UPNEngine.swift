//
//  UPNEngine.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

enum CalculationError : Error {
    case divisionByZero
}

struct UPNEngine {
    
    fileprivate var stack = Stack<Double>()
    
    var top: Double? {
        return stack.top
    }
    
    mutating func enterNumber(_ number : Double) {
        stack.push(number)
    }
    
    mutating func clear() {
        stack.clear()
    }
    
    mutating func add() {
        let a = getNextNumber()
        let b = getNextNumber()

        stack.push(b + a)
    }
    
    mutating func subtract() {
          let a = getNextNumber()
          let b = getNextNumber()

          stack.push(b - a)
      }
    
    mutating func multiply() {
          let a = getNextNumber()
          let b = getNextNumber()

          stack.push(b * a)
      }
    
    mutating func divide() throws {
        let a = getNextNumber()
        let b = getNextNumber()

        if a == 0.0 {
            throw CalculationError.divisionByZero
        }
        
        stack.push(b / a)
    }
    
    private mutating func getNextNumber() -> Double {
        guard let a = stack.pop() else {
            return 0.0
        }

        return a
    }
}
