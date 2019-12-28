//
//  EngCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 23.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class EngCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() {
        
        display.inputMode = .engineering
        
         
    }
    
    
}
