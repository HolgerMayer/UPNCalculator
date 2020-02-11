//
//  RecallSumCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class RecallSumCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    
    init( calculatorEngine: UPNEngine, display : Display, registerController : RegisterController){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
    }
    
    func execute() -> KeyboardState {
        
        if registerController.registerAccess == .Store {
            return .Default
        }
        
        calculatorEngine.removeTop()
        calculatorEngine.removeTop()
        calculatorEngine.enterNumber(registerController.register[5])
        calculatorEngine.enterNumber(registerController.register[3])

        self.display.value = registerController.register[3]
        
        display.needsOverride = true
        display.isPushed = true
        
        return .Default
    }
    
}
