//
//  EEXCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 01.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class EEXCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState{
        
        display.initializeExponentEntry()
         
        return .EEX1
    }
    
    
}
