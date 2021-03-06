//
//  PICommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 16.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

class PiCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
     
    init(calculatorEngine: UPNEngine, display : Display){
         self.calculatorEngine = calculatorEngine
         self.display = display
     }
    
    
    func execute() -> KeyboardState {
        
        calculatorEngine.enterNumber(Double.pi)
        
        display.value = Double.pi
        display.isPushed = true
        
        return .Default
    }
    
    
}

