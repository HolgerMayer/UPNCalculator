//
//  ChangeSignCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation



class ChangeSignCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        display.changeSign()
        display.isPushed = true
        
        guard let value = display.value else {
            return .Default
        }

        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(value)
        
        return .Default
    }
    
    
}

