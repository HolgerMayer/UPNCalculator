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
    
    func execute() {
        guard let value = display.lastValue() else {
             return
        }
        
        calculatorEngine.enterNumber(value)
        display.setDisplay(baseValue: "\(value)", exponent: "")
    }
    
    
}
