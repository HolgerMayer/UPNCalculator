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
    
    func execute() -> KeyboardState {
        
        display.inputMode = .standard

        if !display.isPushed {
                 enterNumberFromInput()
        }
        
        display.updateLastValue()
        
        do {
            try  callEngineCalculation()
        } catch CalculationError.divisionByZero {
            display.setError("Error : division by zero")
            return .Default
        } catch CalculationError.logTenFromZero {
            display.setError("Error : log10 from zero")
            return .Default
        } catch CalculationError.logFromZero {
            display.setError("Error : ln from zero")
            return .Default
        } catch CalculationError.factorialFromNegative {
            display.setError("Error : factorial from negative number")
            return .Default
        } catch CalculationError.resultToLarge {
                display.setError("Error : result to large")
                return .Default
        } catch {
            display.setError("Error during calculation")
            return .Default

        }
        
        guard let result = calculatorEngine.top else {
                 display.setError("Error no result")
            return.Default
        }

        display.value = result
        return .Default
    }
    
    func callEngineCalculation() throws {
        
    }
    
    private func enterNumberFromInput(){
        guard let currentValue = display.value else {
            display.setError("Error wrong number format")
                 return
        }
             
        calculatorEngine.enterNumber(currentValue)
        display.isPushed = true
      }
}
