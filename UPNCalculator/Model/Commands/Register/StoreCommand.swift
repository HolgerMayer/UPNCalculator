//
//  StoreCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 02.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import Foundation


class StoreCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
     
     init( calculatorEngine: UPNEngine, display : Display, registerController:RegisterController){
         self.calculatorEngine = calculatorEngine
         self.display = display
         self.registerController = registerController
     }

    func execute() -> KeyboardState {
        
        self.registerController.intializeStoreOperation()
        
        return .StoreRecall
    }
    
}
