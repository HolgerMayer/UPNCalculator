//
//  FracCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class FracCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() {
        
        guard var value = display.value else {
            return
        }
        
        let temp = value
        value.round(.towardZero)
        let fraction = temp - value
        
        if display.isPushed == false {
            display.value = fraction
        } else {
            
            calculatorEngine.removeTop()
            calculatorEngine.enterNumber(fraction)
            display.value = fraction
       }
        
         
    }
    
    
}
