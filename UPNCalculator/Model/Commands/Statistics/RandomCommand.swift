//
//  RandomCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import Foundation

class RandomCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
     
    init(calculatorEngine: UPNEngine, display : Display){
         self.calculatorEngine = calculatorEngine
         self.display = display
     }
    
    
    func execute() -> KeyboardState {
        
        let value = Double.random(in: 0..<1)
        
        calculatorEngine.enterNumber(value)
        
        display.value = value
        display.isPushed = true
        
        return .Default
    }
    
    
}

