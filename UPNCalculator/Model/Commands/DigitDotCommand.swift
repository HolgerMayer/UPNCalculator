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
    
    
    func execute() {
        if display.isPushed {
            display.clear()
            display.addBaseDigit(digit: digitString)
            display.isPushed = false
        } else {
            display.addBaseDigit(digit:digitString)
        }
    }
    
    
}


