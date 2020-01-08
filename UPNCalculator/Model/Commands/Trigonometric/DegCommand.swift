//
//  DegCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import Foundation


class DegCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
    }
    
    func execute() -> KeyboardState {
        calculatorEngine.trigonometricMode = .deg
        display.trigonometricMode = .deg
        return .Default
    }
    
    
}
