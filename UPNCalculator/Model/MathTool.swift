//
//  MathTool.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class MathTool {
    
    static func factorial(_ value : Double) throws -> Double  {
        
        let temp = Int(value)
        
        var result = 1.0
        
        for i in 1...temp {
             result  *= Double(i)
                 
             if result.isInfinite {
                     throw CalculationError.resultToLarge
             }
         }
        
        return result
    }
}
