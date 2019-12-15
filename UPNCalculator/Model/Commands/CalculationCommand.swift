//
//  CalculationCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class CalculationCommand : Command {
    
    internal var calculatorEngine : UPNEngine
    internal var display : Display
    
    init(calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() {
        if !display.isPushed {
                 enterNumberFromInput()
             }
             
        do {
            try  callEngineCalculation()
        } catch {
            display.setError("Error during calculation")
           return

        }
        
        guard let result = calculatorEngine.top else {
                 display.setError("Error no result")
                 return
        }

        display.setDisplay(baseValue: "\(result)", exponent: "")
    }
    
    func callEngineCalculation() throws {
        
    }
    
    private func enterNumberFromInput(){
        guard let currentValue = display.value() else {
            display.setError("Error wrong number format")
                 return
        }
             
        calculatorEngine.enterNumber(currentValue)
        display.isPushed = true
      }
}
