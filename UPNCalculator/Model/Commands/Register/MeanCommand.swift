//
//  MeanCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


class MeanCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    
    init( calculatorEngine: UPNEngine, display : Display, registerController:RegisterController){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
    }
    
    func execute() -> KeyboardState {
        
        do {
            
            try registerController.calculateMean()
            guard let value = calculatorEngine.top else {
                display.isPushed = true
                display.needsOverride = true
                return .Default
            }
            
            display.value = value
        } catch CalculationError.divisionByZero {
            display.setError("Error : division by zero")
            return .Default
        } catch {
            display.setError("Error during calculation")
            return .Default
            
        }

        display.isPushed = true
        display.needsOverride = true

        return .Default
    }
    
}
