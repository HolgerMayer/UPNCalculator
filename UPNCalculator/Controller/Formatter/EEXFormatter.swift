//
//  EEXFormatter.swift
//  UPNCalculator
//
//  Created by holgermayer on 01.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class EEXFormatter : DisplayFormatter {
    
    var precision: Int
    var exponent : Int
     
    private var numberFormatter : NumberFormatter
    
    init(){
        numberFormatter = NumberFormatter()
        precision = 4
        exponent = 0
        
    }
    
    func convertToString(_ value: Double)  -> String? {
 
        if value.isNaN == true {
            return "Error : Not a number"
        }
        
        if value.isInfinite == true {
            return " Error : result is infinite"
        }
        
        
        if precision > 7 {
            precision = 7
        }
    
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.maximumIntegerDigits = 4
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = precision

        guard let convertedDouble = numberFormatter.string(for: value) else {
              return nil
        }
          
        let spaceCount = 11 - convertedDouble.count - 3
        var spaces = ""
        if spaceCount > 0 {
            spaces = String(repeating: " ", count: spaceCount)
        }
          
        
        numberFormatter.numberStyle = .none

        numberFormatter.maximumIntegerDigits = 2
        numberFormatter.minimumIntegerDigits = 2
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 0

        guard let convertedInt = numberFormatter.string(for: exponent) else {
                   return nil
        }

        let result = convertedDouble + spaces + convertedInt
          return result
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
