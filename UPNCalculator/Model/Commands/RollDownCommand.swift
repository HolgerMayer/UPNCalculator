//
//  RollDownCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 24.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class RollDownCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        
        calculatorEngine.rollDown()
   
        guard let value = calculatorEngine.top else {
            return .Default
        }
   
        display.value = value
   
        return .Default
    }
    
    
}
