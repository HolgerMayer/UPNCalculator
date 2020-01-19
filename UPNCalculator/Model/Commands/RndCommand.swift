//
//  RndCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class RndCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        let topValue = super.calculatorEngine.top
        super.calculatorEngine.removeTop()
        
        guard let valueToRound = topValue else {
            return
        }
        
        let roundedValue = valueToRound.roundToDecimal(display.noOfDecimalPlacesDisplayed)
        
        super.calculatorEngine.enterNumber(roundedValue)
        display.isPushed = true
    }
}

