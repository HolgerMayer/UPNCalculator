//
//  LastXCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

class LastXCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
              
        display.restoreLastValue()
        if display.value != nil {
            calculatorEngine.enterNumber(display.value!)
        }
        return  .Default
    }
    
    
}
