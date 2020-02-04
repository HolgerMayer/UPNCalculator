//
//  StoreRecallDigitCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 02.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

class StoreRecallDigitCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    private var token : String

    init( calculatorEngine: UPNEngine, display : Display, registerController:RegisterController, token : String){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
        self.token = token
    }

    func execute() -> KeyboardState {
        
        guard let index = Int(token) else {
            return .Default
        }
        
        registerController.actionOnRegister(registerIndex: index)
        
        if registerController.registerAccess == .Recall {
            guard let value = calculatorEngine.top else {
                registerController.registerAccess = .None
                return .Default
            }
            
            display.value = value
        }  else {
            
            guard let value = display.value else {
              
                  display.setError( "Error wrong number format")
                  registerController.registerAccess = .None
                  return .Default
              }
              
              calculatorEngine.enterNumber(value)
              display.isPushed = true
              display.needsOverride = true
        }
        
        registerController.registerAccess = .None
        return .Default
    }
    
}
