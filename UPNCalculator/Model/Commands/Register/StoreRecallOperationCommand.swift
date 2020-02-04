//
//  StoreRecallOperationCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 02.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import Foundation


class StoreRecallOperationCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    private var operationString : String

    init( calculatorEngine: UPNEngine, display : Display, registerController:RegisterController, operationString : String){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
        self.operationString = operationString
    }

    func execute() -> KeyboardState {
        
        switch self.operationString {
        case "+":
            registerController.setCalculationOperation(.Add)
            break
        case "-":
            registerController.setCalculationOperation(.Subtract)
            break
        case "/":
            registerController.setCalculationOperation(.Divide)
            break
        case "*":
            registerController.setCalculationOperation(.Multiply)
            break
        default:
            return .Default
        }
        
        
        return .Register1
    }
    
}
