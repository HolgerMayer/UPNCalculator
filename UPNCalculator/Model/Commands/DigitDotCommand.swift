//
//  DigitDotCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


class DigitDotCommand : Command {
    
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var digitString : String
     
    init(calculatorEngine: UPNEngine, display : Display, token : String){
         self.calculatorEngine = calculatorEngine
         self.display = display
         self.digitString = token
    }
    
    
    func execute() -> KeyboardState {
        if display.inputMode == .standard {
            if display.isPushed {
                 if display.needsOverride {
                    display.clear()
                    calculatorEngine.removeTop()
                 } else {
                    display.clear()
                    display.needsOverride = true
                }
                
                display.addBaseDigit(digit: digitString)
                display.isPushed = false
                 guard let value = display.value else {
                    return .Default
                }
                calculatorEngine.enterNumber(value)
            } else {
                if display.needsOverride {
                    calculatorEngine.removeTop()
                }

                display.addBaseDigit(digit:digitString)
                guard let value = display.value else {
                     return .Default
                }
                
                calculatorEngine.enterNumber(value)
            }
        }
        
        return .Default
   }
   
    
}


