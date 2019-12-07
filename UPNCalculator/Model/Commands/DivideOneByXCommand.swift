//
//  DivideOneByXCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 08.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class DivideOneByXCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: OutputDisplay) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        
        guard let a =  super.calculatorEngine.top else {
            display.setError("Please enter x value")
            return
        }
        super.calculatorEngine.removeTop()
        super.calculatorEngine.enterNumber(1.0)
        super.calculatorEngine.enterNumber(a)
        
        
        do {
            try super.calculatorEngine.divide()
        } catch {
            super.display.setError("Error during division calculation")
        }

    }
}
