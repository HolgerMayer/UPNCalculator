//
//  OutputDisplay.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


public protocol OutputDisplay {
    
    var isPushed : Bool {get set}
    var state : String {get set}
    
    func value() -> Double?
    
    func clear()
    func addBaseDigit(digit : String)
    func removeBaseDigit(digit : String)
    func changeSign()
    func addExponentDigit(digit : String)
    func removeExponentDigit(digit : String)
    func setDisplay(baseValue : String, exponent:String?)
    func setError(_ errorMessage : String)
    
}
