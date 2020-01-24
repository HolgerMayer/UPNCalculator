//
//  DigitCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class EnterCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        guard let value = display.value else {
        
            display.setError( "Error wrong number format")
            return .Default
        }
        
        calculatorEngine.enterNumber(value)
        display.isPushed = true
        display.needsOverride = true
        return .Default
    }
    
    
}
