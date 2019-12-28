//
//  CalculatorOutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit


class CalculatorDisplay : Display {
     
    
    private var displayFormatter : DisplayFormatter?
    private var fixFormatter = FixFormatter()
    private var scientificFormatter = ScientificFormatter()
    private var engFormatter = EngFormatter()
    
    
    private var displayText : String
    private var lastDisplayText : String
    private var lastValue : Double = 0.0
    
    private var currentValue : Double?
    
    weak var delegate : DisplayDelegate?
    
    var isPushed: Bool {
        didSet{
            if isPushed == true  && oldValue == false {
                guard let numberValue = currentValue else {
                    return
                }
                guard let newDisplayString =    displayFormatter!.convertToString(numberValue) else {
                    displayText = "???"
                    if delegate != nil {
                        delegate?.didChangeDisplay(value: displayText)
                    }
                    return
                }
                    
                displayText = newDisplayString
            }
                
            if delegate != nil {
                   delegate?.didChangeDisplay(value: displayText)
            }
        }
        
    }
    
    var noOfDecimalPlacesDisplayed : Int
    
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
            updateDisplay()
        }
    }
    
    var inputMode : InputMode {
        didSet {
            switch inputMode {
            case .fix :
                displayFormatter = fixFormatter
                break
            case .scientific :
                displayFormatter = scientificFormatter
                break
            case .engineering :
                displayFormatter = engFormatter
                break
default:
                break
            }
        }
    }

    
    init() {
        isPushed = false
        state = .Default
        displayText = ""
        lastDisplayText = ""
        noOfDecimalPlacesDisplayed = 4
        currentValue = nil
        displayFormatter = fixFormatter
        inputMode = .standard
        setupNumberFormatter()
}
    
    func clear() {
        isPushed = false
        state = .Default
        displayText = ""
        currentValue = nil
        delegate?.didChangeDisplay(value: "")
        inputMode = .standard
        
    }
    

    func updateLastValue() {
        lastDisplayText = displayText
        if currentValue != nil {
            lastValue = currentValue!
        } else {
            lastValue = 0.0
        }
    }
    
    func restoreLastValue() {
        
        displayText = lastDisplayText
        currentValue = lastValue
        
        if delegate != nil {
             delegate?.didChangeDisplay(value: displayText)
        }
    }
    
    func addBaseDigit(digit: String) {
 
        switch inputMode {
        case .fix, .scientific, .engineering:
             if digit != "." {
                guard let newDecimalPlaces = Int(digit) else {
                    return
                }
                noOfDecimalPlacesDisplayed = newDecimalPlaces
                setupNumberFormatter()
                updateDisplay()
            }
            return
        default:
            var appendChar = digit
            let locale = NSLocale()
            if appendChar == locale.decimalSeparator{
                
                appendChar = ","
            }
            
            let newText = displayText + appendChar
            displayText = newText
            currentValue = Double(displayText)
            delegate?.didChangeDisplay(value: newText)
        }
    }
    
    func removeBaseDigit() {
         
        if displayText.count > 0 {
            displayText.removeLast()
        }
        currentValue = Double(displayText)
        delegate?.didChangeDisplay(value:displayText)
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
        delegate?.didChangeDisplay(value:errorMessage)
    }
    
    private func setupNumberFormatter(){
        fixFormatter.precision = noOfDecimalPlacesDisplayed
        scientificFormatter.precision = noOfDecimalPlacesDisplayed
        engFormatter.precision = noOfDecimalPlacesDisplayed
    }
   
    private func updateDisplay(){
        if currentValue == nil {
             displayText = ""
         } else {
            guard let newDisplayString = displayFormatter!.convertToString(currentValue!) else {
                 displayText = "???"
                 if delegate != nil {
                     delegate?.didChangeDisplay(value: displayText)
                 }
                 return
             }
             
             displayText = newDisplayString
         }
         
         if delegate != nil {
             delegate?.didChangeDisplay(value: displayText)
         }
    }
}
