//
//  EEXChangeSignCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 03.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class EEXChangeSignCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        
        calculatorEngine.removeTop()
        
        display.changeExponentSign()
        
        guard let value = display.value else {
            return .EEX1
        }
        calculatorEngine.enterNumber(value)
        
        return .EEX1
    }
    
    
}

