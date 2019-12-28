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
    func didChangeState(_ state : KeyboardState)
  
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
    var state : KeyboardState {get set}
    var value : Double? {get set}
    var inputMode : InputMode {get set}
    
    func restoreLastValue() 
    func updateLastValue()
    
    func clear()
    func addBaseDigit(digit : String)
    func removeBaseDigit()
    func changeSign()
    func addExponentDigit(digit : String)
    func removeExponentDigit(digit : String)
    func setError(_ errorMessage : String)
}
