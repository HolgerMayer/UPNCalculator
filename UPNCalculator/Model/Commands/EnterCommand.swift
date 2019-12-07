//
//  DigitCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class EnterCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : OutputDisplay
    
    init( calculatorEngine: UPNEngine, display : OutputDisplay){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() {
        guard let value = display.value() else {
        
            display.setError( "Error wrong number format")
            return
        }
        
        calculatorEngine.enterNumber(value)
        display.isPushed = true
    }
    
    
}
