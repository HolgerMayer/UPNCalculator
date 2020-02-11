//
//  StandardDeviationCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


class StandardDeviationCommand : Command {
    
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
            
            try registerController.calculateStandardDeviation()
            guard let value = calculatorEngine.top else {
                display.isPushed = true
                display.needsOverride = true
                return .Default
            }
            
            display.value = value
        } catch CalculationError.improperStatisticsOperation {
            display.setError("Error : no elements to calculate")
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
