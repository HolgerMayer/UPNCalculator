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

class UPNEngine {
    
    fileprivate var stack = Stack<Double>()
    
    var top: Double? {
        return stack.top
    }
    
    func enterNumber(_ number : Double) {
        stack.push(number)
    }
    
    func clear() {
        stack.clear()
    }
    
    
    func removeTop() {
        stack.pop()
    }
    
    func add() {
        let a = getNextNumber()
        let b = getNextNumber()

        stack.push(b + a)
    }
    
    func subtract() {
          let a = getNextNumber()
          let b = getNextNumber()

          stack.push(b - a)
      }
    
    func multiply() {
          let a = getNextNumber()
          let b = getNextNumber()

          stack.push(b * a)
      }
    
    func divide() throws {
        let a = getNextNumber()
        let b = getNextNumber()

        if a == 0.0 {
            throw CalculationError.divisionByZero
        }
        
        stack.push(b / a)
    }
    
    
    func sin()  {
        let a = getNextNumber()
 
        stack.push(Darwin.sin(a))
    }
  
    func cos()  {
        let a = getNextNumber()
    
        stack.push(Darwin.cos(a))
    }

    func tan()  {
        let a = getNextNumber()
    
        stack.push(Darwin.tan(a))
    }
    
    func sqrt()  {
        let a = getNextNumber()
    
        stack.push(Darwin.sqrt(a))
    }

    private func getNextNumber() -> Double {
        guard let a = stack.pop() else {
            return 0.0
        }

        return a
    }
}
