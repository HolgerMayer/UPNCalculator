//
//  RadToDegCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 09.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class RadToDegCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        guard let radValue = calculatorEngine.top else {
            return
        }
        
        
        calculatorEngine.removeTop()
        
  
        let degValue = TrigonometricConverter.convertRadToDeg(radValue)
        
        calculatorEngine.enterNumber(degValue)
    }
}

