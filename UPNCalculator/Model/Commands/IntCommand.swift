//
//  IntCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class IntCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        
        guard var value = display.value else {
            return .Default
        }
        
        display.updateLastValue()
        
        value.round(.towardZero)
        
        if display.isPushed == false {
            display.value = value
        } else {
            
            calculatorEngine.removeTop()
            calculatorEngine.enterNumber(value)
            display.value = value
       }
        
        return .Default
        
         
    }
    
    
}
