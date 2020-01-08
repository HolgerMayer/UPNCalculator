//
//  FactorialCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//
import Foundation

class FactorialCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        guard let endValue = calculatorEngine.top else {
            return
        }
        
        
        calculatorEngine.removeTop()
        
        if endValue < 0 {
            throw CalculationError.factorialFromNegative
        }
        
        let upperInterval = Int(endValue)
        
        if upperInterval == 0 {
            calculatorEngine.enterNumber(1.0)
            return
        }
        
        var result : Double = 1
        
        for i in 1...upperInterval {
               result  *= Double(i)
            
            if result.isInfinite {
                throw CalculationError.resultToLarge
            }
        }

        calculatorEngine.enterNumber(result)
    }
}

