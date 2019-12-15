//
//  PowCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class PowCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        var  a =  super.calculatorEngine.top
        if a == nil {
              a = 1.0
              super.calculatorEngine.enterNumber(a!)
              return
          }
        
        super.calculatorEngine.pow()
    }
}
