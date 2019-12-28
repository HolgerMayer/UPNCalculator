//
//  DisplayFormatter.swift
//  UPNCalculator
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

protocol DisplayFormatter {
    
    var precision : Int {get set}
    
    func convertToString(_ value: Double) -> String?
    func convertToDouble(baseDigits : String, exponent : String) -> Double
    
}


extension DisplayFormatter {
    
    func convertWithExponent(_ value : Double, exponentModulo : Int) -> String? {
        
          
        let exponentFormatter = NumberFormatter()
        exponentFormatter.numberStyle = .none
        exponentFormatter.minimumIntegerDigits = 2
        exponentFormatter.maximumIntegerDigits = 2
        exponentFormatter.maximumFractionDigits = 0
        exponentFormatter.minimumFractionDigits = 0

        
        let numberFormatter = NumberFormatter()
        
        if value == 0.0 {
            numberFormatter.minimumSignificantDigits = precision
            numberFormatter.maximumSignificantDigits = precision
            
            guard let convertedDouble = numberFormatter.string(for: value) else {
                   return nil
               }
            
            let spaceCount = 11 - convertedDouble.count // 10 number characters + 1 dot
            var spaces = ""
            if spaceCount > 0 {
                  spaces = String(repeating: " ", count: spaceCount)
            }
                  
            let result = convertedDouble + spaces

            return result
          }

        
        let log10Value = Darwin.log10(abs(value))
        let exponentValue = Double(Int(log10Value) / exponentModulo) * Double(exponentModulo)
        let remainderValue = value / Darwin.pow(10,exponentValue)
        var currentPrecision = precision + 1
        if currentPrecision > 7 {
            currentPrecision = 7
        }
        numberFormatter.minimumSignificantDigits = currentPrecision
        numberFormatter.maximumSignificantDigits = currentPrecision

        guard let convertedDouble = numberFormatter.string(for: remainderValue) else {
             return nil
         }

        guard let exponent = exponentFormatter.string(for:exponentValue) else {
            return nil
        }
        
        let baseLen = convertedDouble.count
        let exponentLen = exponent.count
        
        let spaceCount = 11 - baseLen - exponentLen // 10 number characters + 1 dot
        var spaces = ""
        if spaceCount > 0 {
            spaces = String(repeating: " ", count: spaceCount)
        }
        
        let result = convertedDouble + spaces + exponent

        return result
    }
}
