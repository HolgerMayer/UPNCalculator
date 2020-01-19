//
//  OutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


public protocol DisplayDelegate : AnyObject {
    func didChangeDisplay(value : String)
    func didChangeDisplayToError(value : String)
    func didClearError()
    func didChangeState(_ state : KeyboardState)
    func didChangeTrigonometricMode(_ mode : TrigonometricMode)
}


public enum InputMode {
    case standard
    case fix
    case scientific
    case engineering
}

public protocol Display {
    
    var delegate : DisplayDelegate?  {get set}
    
    var isPushed : Bool {get set}

    var value : Double? {get set}
    var inputMode : InputMode {get set}
    var state: KeyboardState {get set}
    var trigonometricMode: TrigonometricMode {get set}
    var noOfDecimalPlacesDisplayed : Int {get set}
    func restoreLastValue() 
    func updateLastValue()
    
    func clear()
    func initializeExponentEntry()
    func addBaseDigit(digit : String)
    func addExponentDigit(digit : String)
    func removeExponentDigit()
    func removeBaseDigit()
    func changeSign()
    func changeExponentSign()
    func setError(_ errorMessage : String)
}
