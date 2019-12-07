//
//  CalculatorOutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit


class CalculatorOutputDisplay : OutputDisplay {
    
    var displayLabel : UILabel!
    
    var isPushed: Bool
    var state: String
    
    init(displayLabel : UILabel) {
         self.displayLabel = displayLabel
         isPushed = false
         state = ""
         displayLabel.text! = ""
    }
    
    func clear() {
        isPushed = false
        state = ""
        displayLabel.text! = ""
    }

    
    func value() -> Double? {
        guard let value = Double(displayLabel.text!) else {
               return nil
           }
        
        return value
    }
    
    func addBaseDigit(digit: String) {
        displayLabel.text! += digit
    }
    
    func removeBaseDigit(digit: String) {
        displayLabel.text!.removeLast()
    }
    
    func changeSign() {
        guard let currentValue = value() else {
                      return
        }

        displayLabel.text! = "\(-1 * currentValue)"
    }
    
    func addExponentDigit(digit: String) {
        // TODO:
    }
    
    func removeExponentDigit(digit: String) {
        // TODO:
    }
    
    func setDisplay(baseValue: String, exponent: String?) {
        
        displayLabel.text! = baseValue
        
        // TODO : set exponent
    }
    
    func setError(_ errorMessage: String) {
        displayLabel.text! = errorMessage
    }
    
    
}
