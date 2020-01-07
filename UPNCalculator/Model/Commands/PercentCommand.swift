//
//  PercentCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class PercentCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {

        guard let percentValue = calculatorEngine.top else {
            return
        }
        
        calculatorEngine.removeTop()
        
        guard let baseNumber = calculatorEngine.top else {
            return
        }
        
        let percentageOfBaseValue = baseNumber / 100 * percentValue
        
        calculatorEngine.enterNumber(percentageOfBaseValue)
    }
}

