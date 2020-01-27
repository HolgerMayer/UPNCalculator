//
//  CLxCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class CLxCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
         
        display.clear()
        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(0)
        display.needsOverride = true
        display.isPushed = false
        return .Default
    }
    
    
}

