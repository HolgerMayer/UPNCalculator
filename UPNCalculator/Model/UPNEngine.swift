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
    
    var stack = Stack<Double>()
    
    var trigonometricMode : TrigonometricMode = .deg
    
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
    
    func convertToRad(_ value : Double) -> Double {
        switch trigonometricMode {
        case .deg:
            return TrigonometricConverter.convertDegToRad(value)
        case .grad:
            return TrigonometricConverter.convertGradToRad(value)
        case .rad:
            return value
        }
    }
    
    func convertFromRad(_ value: Double) ->Double {
        switch trigonometricMode {
        case .deg:
            return TrigonometricConverter.convertRadToDeg(value)
        case .grad:
             return TrigonometricConverter.convertRadToGrad(value)
        case .rad:
             return value

        }
    }
}
