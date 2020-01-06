//
//  ClearCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class ClearCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
         calculatorEngine.clear()
         display.clear()
        
        
        return .Default
    }
    
    
}
