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
    private var lastDisplayText : String
    
    private var currentValue : Double?
    
    weak var delegate : DisplayDelegate?
    var isPushed: Bool
    
    
    var state: KeyboardState {
        didSet {
            if delegate != nil {
                delegate?.didChangeState(state)
            }
        }
    }
    
    var value : Double? {
        get {
            return currentValue
        }
        
        set (newValue) {
            currentValue = newValue
            if currentValue == nil {
                displayText = ""
            } else {
                displayText = "\(currentValue!)"
            }
            
            if delegate != nil {
                delegate?.didChangeBase(value: displayText)
            }
        }
    }
    
    
    init() {
        isPushed = false
        state = .Default
        displayText = ""
        lastDisplayText = ""
        currentValue = nil
    }
    
    func clear() {
        isPushed = false
        state = .Default
        displayText = ""
        currentValue = nil
        delegate?.didChangeBase(value: "")
    }

    

    func updateLastValue() {
        lastDisplayText = displayText
    }
    
    func lastValue() -> Double? {
        
          guard let value = Double(lastDisplayText) else {
                  return nil
              }
           
           return value
    }
    
    func addBaseDigit(digit: String) {
 
        let newText = displayText + digit
        displayText = newText
        currentValue = Double(displayText)
        delegate?.didChangeBase(value: newText)
    }
    
    func removeBaseDigit() {
         
        if displayText.count > 0 {
            displayText.removeLast()
        }
        currentValue = Double(displayText)
        delegate?.didChangeBase(value:displayText)
    }
    
    func changeSign() {
        guard let valueToChange = value else {
            return
        }
        
      value = -1 * valueToChange
    }
    
    func addExponentDigit(digit: String) {
        // TODO:
    }
    
    func removeExponentDigit(digit: String) {
        // TODO:
    }
      
    func setError(_ errorMessage: String) {
        displayText = errorMessage
        delegate?.didChangeBase(value:errorMessage)
    }
    
    
}
