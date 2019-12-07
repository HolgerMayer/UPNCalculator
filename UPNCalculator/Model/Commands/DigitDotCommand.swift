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
    private var display : OutputDisplay
    private var digitString : String
     
    init(calculatorEngine: UPNEngine, display : OutputDisplay){
         self.calculatorEngine = calculatorEngine
         self.display = display
         self.digitString = ""
    }
    
    func button(_ digitString: String){
        self.digitString = digitString
    }
    
    
    func execute() {
        if display.isPushed {
            display.setDisplay(baseValue: digitString, exponent: "")
            display.isPushed = false
        } else {
            display.addBaseDigit(digit:digitString)
        }
    }
    
    
}
