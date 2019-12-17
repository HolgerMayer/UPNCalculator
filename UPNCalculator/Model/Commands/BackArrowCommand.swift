//
//  BackArrowCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class BackArrowCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() {
        
        if display.isPushed == false {
            display.removeBaseDigit()
        } else {
            display.setDisplay(baseValue: "0.0000", exponent: "")
            display.isPushed = false
        }
        
         
    }
    
    
}
