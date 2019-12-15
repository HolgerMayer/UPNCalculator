//
//  OutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


public protocol DisplayDelegate : AnyObject {
    func didChangeBase(value : String)
    func didChangeExponent(value : String)
    func didChangeState(_ state : KeyboardState)
  
}


public protocol Display {
    
    var delegate : DisplayDelegate?  {get set}
    
    var isPushed : Bool {get set}
    var state : KeyboardState {get set}
    
    func value() -> Double?
    
    func clear()
    func addBaseDigit(digit : String)
    func removeBaseDigit()
    func changeSign()
    func addExponentDigit(digit : String)
    func removeExponentDigit(digit : String)
    func setDisplay(baseValue : String, exponent:String?)
    func setError(_ errorMessage : String)
    
}
