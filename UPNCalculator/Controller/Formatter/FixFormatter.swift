//
//  FixFormatter.swift
//  UPNCalculator
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class FixFormatter : DisplayFormatter {
    
    var precision: Int
     
    private var numberFormatter : NumberFormatter
    
    init(){
        numberFormatter = NumberFormatter()
        precision = 4
        
    }
    
    func convertToString(_ value: Double)  -> String? {
 
        if value.isNaN == true {
            return "Error : Not a number"
        }
        
        if value.isInfinite == true {
            return " Error : result is infinite"
        }
        
        
        let log10Value = Darwin.log10(abs(value))
        if  abs(log10Value) <= 6 {
            
            numberFormatter.minimumFractionDigits = precision
            numberFormatter.maximumFractionDigits = precision

            guard let convertedDouble = numberFormatter.string(for: value) else {
                return nil
            }
            let spaceCount = 11 - convertedDouble.count
            var spaces = ""
            if spaceCount > 0 {
                 spaces = String(repeating: " ", count: spaceCount)
            }
            
            let result = convertedDouble + spaces
            return result
        } else {
            
            return convertWithExponent(value, exponentModulo: 1)
        }
    }
    
    func convertToDouble(baseDigits: String, exponent: String) -> Double {
        guard let baseValue = Double(baseDigits) else {
            return 0.0
        }
        
        guard let exponentValue = Double(exponent) else {
            return baseValue
        }
        
        return Darwin.pow(10,exponentValue) * baseValue
    }
    
    
}
