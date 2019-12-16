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
    
    
    func execute() {
        
        calculatorEngine.enterNumber(Double.pi)
        
        display.setDisplay(baseValue: "\(Double.pi)", exponent: "")
        display.isPushed = true
    }
    
    
}

