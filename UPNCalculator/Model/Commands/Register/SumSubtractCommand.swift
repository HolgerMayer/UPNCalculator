//
//  SumSubtractCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 10.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class SumSubtractCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    
    init( calculatorEngine: UPNEngine, display : Display, registerController : RegisterController){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
    }
    
    func execute() -> KeyboardState {
        
        registerController.sumSubtract()
        calculatorEngine.removeTop()
        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(registerController.register[2])
      
        self.display.value = registerController.register[2]
        
        display.needsOverride = true
        display.isPushed = true
        
        return .Default
    }
    
}
