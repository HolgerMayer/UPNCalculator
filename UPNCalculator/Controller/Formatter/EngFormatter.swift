//
//  EngFormatter.swift
//  UPNCalculator
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import Foundation


class EngFormatter : DisplayFormatter {
      var precision: Int
       
     
      init(){
          precision = 4
      }
      
      func convertToString(_ value: Double)  -> String? {
        
        if value.isNaN == true {
            return "Error : Not a number"
        }
 
        if value.isInfinite == true {
            return " Error : result is infinite"
        }

        return convertWithExponent(value, exponentModulo: 3)
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
