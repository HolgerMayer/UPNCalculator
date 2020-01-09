//
//  DegToRadCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 09.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class DegToRadCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        guard let degValue = calculatorEngine.top else {
            return
        }
        
        
        calculatorEngine.removeTop()
        
  
        let radValue = TrigonometricConverter.convertDegToRad(degValue)
        
        calculatorEngine.enterNumber(radValue)
    }
}

