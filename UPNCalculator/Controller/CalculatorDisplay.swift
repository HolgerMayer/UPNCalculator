//
//  CalculatorOutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit


class CalculatorDisplay : Display {
    
    private var numberFormatter : NumberFormatter
    private var displayText : String
    private var lastDisplayText : String
    
    private var currentValue : Double?
    
    weak var delegate : DisplayDelegate?
    
    var isPushed: Bool {
        didSet{
            if isPushed == true  && oldValue == false {
                guard let numberValue = currentValue else {
                    return
                }
                guard let newDisplayString = numberFormatter.string(for: numberValue) else {
                    displayText = "???"
                    if delegate != nil {
                        delegate?.didChangeBase(value: displayText)
                    }
                    return
                }
                    
                displayText = newDisplayString
            }
                
            if delegate != nil {
                   delegate?.didChangeBase(value: displayText)
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
                numberFormatter.numberStyle = NumberFormatter.Style.none
                break
            case .scientific :
                numberFormatter.numberStyle = NumberFormatter.Style.scientific
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
        numberFormatter = NumberFormatter()
        inputMode = .standard
        setupNumberFormatter()
}
    
    func clear() {
        isPushed = false
        state = .Default
        displayText = ""
        currentValue = nil
        delegate?.didChangeBase(value: "")
        inputMode = .standard
        
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
 
        switch inputMode {
        case .fix, .scientific:
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
            delegate?.didChangeBase(value: newText)
        }
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
    
    private func setupNumberFormatter(){
        numberFormatter.minimumFractionDigits = noOfDecimalPlacesDisplayed
        numberFormatter.maximumFractionDigits = noOfDecimalPlacesDisplayed
    }
   
    private func updateDisplay(){
        if currentValue == nil {
             displayText = ""
         } else {
             guard let newDisplayString = numberFormatter.string(for: currentValue!) else {
                 displayText = "???"
                 if delegate != nil {
                     delegate?.didChangeBase(value: displayText)
                 }
                 return
             }
             
             displayText = newDisplayString
         }
         
         if delegate != nil {
             delegate?.didChangeBase(value: displayText)
         }
    }
}
