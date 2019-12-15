//
//  CalculatorOutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit


class CalculatorDisplay : Display {
    
    private var displayText : String
    
    weak var delegate : DisplayDelegate?
    var isPushed: Bool
    var state: KeyboardState {
        didSet {
            if delegate != nil {
                delegate?.didChangeState(state)
            }
        }
    }
    
    
    
    init() {
         isPushed = false
         state = .Default
        displayText = ""
    }
    
    func clear() {
        isPushed = false
        state = .Default
        displayText = ""
        delegate?.didChangeBase(value: "")
    }

    
    func value() -> Double? {
        
        
        guard let value = Double(displayText) else {
               return nil
           }
        
        return value
    }
    
    func addBaseDigit(digit: String) {
 
        let newText = displayText + digit
        displayText = newText
        delegate?.didChangeBase(value: newText)
    }
    
    func removeBaseDigit() {
         
        if displayText.count > 0 {
            displayText.removeLast()
        }
        delegate?.didChangeBase(value:displayText)
    }
    
    func changeSign() {
        guard let currentValue = value() else {
                      return
        }

        displayText = "\(-1 * currentValue)"
        delegate?.didChangeBase(value:displayText)
    }
    
    func addExponentDigit(digit: String) {
        // TODO:
    }
    
    func removeExponentDigit(digit: String) {
        // TODO:
    }
    
    func setDisplay(baseValue: String, exponent: String?) {
        
        displayText = baseValue
        delegate?.didChangeBase(value:baseValue)        
        // TODO : set exponent
    }
    
    func setError(_ errorMessage: String) {
        displayText = errorMessage
        delegate?.didChangeBase(value:errorMessage)
    }
    
    
}
