//
//  UPNEngine.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

// Important:
// TODO: getNextNumber needs to return nil if stack is empty
//       the calculationfunctions need to handle nil individually

import Foundation

enum CalculationError : Error {
    case divisionByZero
    case logTenFromZero
    case logFromZero
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
        let _ = stack.pop()
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
    
    func asin()  {
        let a = getNextNumber()
        
        stack.push(Darwin.asin(a))
    }
     
    func acos()  {
        let a = getNextNumber()
       
        stack.push(Darwin.acos(a))
    }

    func atan()  {
        let a = getNextNumber()
       
        stack.push(Darwin.atan(a))
    }
    
    func pow() {
        let exponent = getNextNumber()
        var base = getNextNumberOrNil()
        if base == nil {
            base = exponent
        }
        
        stack.push(Darwin.pow(base!,exponent))
    }
    
    func sqrt()  {
        let a = getNextNumber()
    
        stack.push(Darwin.sqrt(a))
    }
    
    
    func exp() {
        let a = getNextNumber()
        
        stack.push(Darwin.exp(a))
    }
    
    
    func log() throws {
        let a = getNextNumber()
        
        if a == 0.0 {
               throw CalculationError.logFromZero
        }

        stack.push(Darwin.log(a))
    }

    func log10() throws {
        let a = getNextNumber()
        
        if a == 0.0 {
              throw CalculationError.logTenFromZero
          }
        stack.push(Darwin.log10(a))
    }

    private func getNextNumber() -> Double {
        guard let a = stack.pop() else {
            return 0.0
        }

        return a
    }
    
    private func getNextNumberOrNil() -> Double? {
        guard let a = stack.pop() else {
            return nil
        }

        return a
    }
}
