//
//  ExchangeXYCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class ExchangeXYCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        var  a  : Double = 0.0

        // We need to seperate handle two cases:
        // 1 : display is pushed on stack
        // 2 : display is not pushed on stack
        if display.isPushed == true {
            guard let valueX = calculatorEngine.top else {
                return .Default
            }
            a = valueX
            calculatorEngine.removeTop()
        } else {
            guard let valueX = display.value else {
                return .Default
            }

            a = valueX
        }
        
        
        guard let valueY = calculatorEngine.top else {
            return .Default
        }
        
        
        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(a)
        calculatorEngine.enterNumber(valueY)
        display.value = valueY
        display.isPushed = true
        
        return .Default
    }
    
    
}
