//
//  PercentDifferenceCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class PercentDifferenceCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        guard let secondValue = calculatorEngine.top else {
            return
        }
        
        calculatorEngine.removeTop()
        
        guard let firstValue = calculatorEngine.top else {
            return
        }
        
        calculatorEngine.removeTop()
        
        let onePercent = firstValue / 100.0
        
        let difference = secondValue - firstValue
        
        let percentageDifference = difference / onePercent
        
        calculatorEngine.enterNumber(percentageDifference)
    }
}

