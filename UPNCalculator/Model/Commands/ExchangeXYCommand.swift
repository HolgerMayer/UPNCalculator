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
        guard let valueX = display.value else {
            return .Default
        }
        
        guard let valueY = calculatorEngine.top else {
            return .Default
        }
        
        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(valueX)
        display.value = valueY
        
        return .Default
    }
    
    
}
