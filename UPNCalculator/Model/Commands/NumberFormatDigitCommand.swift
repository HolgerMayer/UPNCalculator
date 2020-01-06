//
//  NumberFormatDigitCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 03.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class NumberFormatDigitCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var digitString : String
     
    init(calculatorEngine: UPNEngine, display : Display, token : String){
         self.calculatorEngine = calculatorEngine
         self.display = display
         self.digitString = token
    }
    
    
    func execute() -> KeyboardState {

        display.addBaseDigit(digit:digitString)
        display.inputMode = .standard
        
        return .Default
   }
   
    
}
