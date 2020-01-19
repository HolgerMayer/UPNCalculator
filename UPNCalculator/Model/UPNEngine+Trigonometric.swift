//
//  UPNEngine+Trigonometric.swift
//  UPNCalculator
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

extension UPNEngine {
    
    
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
    
    func polarConversion() {
        let x = getNextNumber()
        let y = getNextNumber()
        let xSquare = x * x
        let ySquare = y * y
        let squareSums = xSquare + ySquare
        let r = Darwin.sqrt(squareSums)
        let aRad = Darwin.atan(y / x)
        let angle = convertFromRad(aRad)
        stack.push(angle)
        stack.push(r)

    }
    
    func rectangularConversion() {
        let r = getNextNumber()
        let a = getNextNumber()
        let b = convertToRad(a)
        let x = Darwin.cos(b) * r
        let y = Darwin.sin(b) * r
        stack.push(y)
        stack.push(x)
    }
    
      func sin()  {
          let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.sin(b)
          stack.push(c)
          
      }
    
      func cos()  {
           let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.cos(b)
          stack.push(c)
      }

      func tan()  {
          let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.tan(b)
          stack.push(c)

      }
      
      func asin()  {
          let a = getNextNumber()
          let b = Darwin.asin(a)
          let c = convertFromRad(b)
          stack.push(c)
      }
       
      func acos()  {
          let a = getNextNumber()
          let b = Darwin.acos(a)
          let c = convertFromRad(b)
          stack.push(c)
      }

      func atan()  {
          let a = getNextNumber()
          let b = Darwin.atan(a)
          let c = convertFromRad(b)
          stack.push(c)
      }
    
    //
    // ### Hyperbolic functions
    //
      
     func sinh()  {
          let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.sinh(b)
          stack.push(c)
          
      }
    
      func cosh()  {
           let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.cosh(b)
          stack.push(c)
      }

      func tanh()  {
          let a = getNextNumber()
          let b = convertToRad(a)
          let c = Darwin.tanh(b)
          stack.push(c)

      }
      
      func asinh()  {
          let a = getNextNumber()
          let b = Darwin.asinh(a)
          let c = convertFromRad(b)
          stack.push(c)
      }
       
      func acosh()  {
          let a = getNextNumber()
          let b = Darwin.acosh(a)
          let c = convertFromRad(b)
          stack.push(c)
      }

      func atanh()  {
          let a = getNextNumber()
          let b = Darwin.atanh(a)
          let c = convertFromRad(b)
          stack.push(c)
      }

}
