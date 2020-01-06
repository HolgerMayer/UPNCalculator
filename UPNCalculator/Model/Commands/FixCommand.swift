//
//  FixCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 21.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

class FixCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() ->KeyboardState {
        
        display.inputMode = .fix
        return .Fix
    }
    
    
}
