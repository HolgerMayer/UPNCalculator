//
//  DivideCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation



class DivideCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: OutputDisplay) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        do {
            try super.calculatorEngine.divide()
        } catch {
            super.display.setError("Error during division calculation")
        }

    }
}
