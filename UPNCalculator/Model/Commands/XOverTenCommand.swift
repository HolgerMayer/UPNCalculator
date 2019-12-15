//
//  XOverTenCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class XOverTenCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
       guard let a =  super.calculatorEngine.top else {
                display.setError("Please enter x value")
                return
            }
            super.calculatorEngine.removeTop()
            super.calculatorEngine.enterNumber(10.0)
            super.calculatorEngine.enterNumber(a)
            
            super.calculatorEngine.pow()
    }
}
