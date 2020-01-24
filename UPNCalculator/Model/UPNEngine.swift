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

public enum CalculationError : Error {
    case divisionByZero
    case logTenFromZero
    case logFromZero
    case factorialFromNegative
    case resultToLarge
}

public enum TrigonometricMode : String {
    case deg  = "DEG"
    case rad = "RAD"
    case grad = "GRAD"
}

class UPNEngine {
    
    var stack = Stack<Double>(0.0)
    
    var trigonometricMode : TrigonometricMode = .deg
    
 

    var top: Double? {
        return stack.top
    }

    func peek(register : StackRegister) -> Double? {
        return stack.peek(register: register)
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
    
    func abs(){
        let a = getNextNumber()
        
        stack.push(Swift.abs(a))
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
    
    func hmmssToDecDegreeConversion()  {
      let a = getNextNumber()
        
      let hours = Int(a)
      let minutes =  Int((a - Double(hours)) * 100)
      let seconds =  ((a - Double(hours)) * 100 - Double(minutes)) * 100
        
      let result = Double(hours) + Double(minutes) / 60.0 + seconds / 3600.0

      stack.push(result)
    }
      
    func decDegreeToHMMSSConversion()  {
        let a = getNextNumber()

        
        let hours = Int(a)
        let minutes = Int((a-Double(hours))  * 60.0 )
        let seconds = (a - Double(hours) - (Double(minutes) / 60.0)) * 3600
        
        let result = Double(hours) + Double(minutes) / 100 + seconds / 10000
        
        stack.push(result)
    }
      

    public func getNextNumber() -> Double {
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
