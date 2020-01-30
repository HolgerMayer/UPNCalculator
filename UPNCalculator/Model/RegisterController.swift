//
//  RegisterController.swift
//  UPNCalculator
//
//  Created by holgermayer on 30.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

public enum RegisterAccess : Int {
    case Store
    case Recall
    case None
}

public enum RegisterOperation : Int {
    case Add
    case Subtract
    case Multiply
    case Divide
    case None
}


public protocol RegisterControllerDelegate : AnyObject {
    func getStackXValue() -> Double
    func setStackXValue(_ value : Double)
}

class RegisterController {
    weak var delegate : RegisterControllerDelegate?

    var register = [Double](repeating : 0.0, count : 1000)
    var registerAccess : RegisterAccess = .None
    var registerAccessOperation : RegisterOperation = .None
    var registerAccessIndex : Int = 0
    
    init() {
    }
    
    func intializeStoreOperation() {
        registerAccess = .Store
        registerAccessOperation = .None
        registerAccessIndex = 0
    }
    
    func initializeRecallOperation() {
        registerAccess = .Recall
        registerAccessOperation = .None
        registerAccessIndex = 0
    }
    
    func setCalculationOperation(_ operation : RegisterOperation){
        registerAccessOperation = operation
    }
    
    func setRegisterIndex10() {
        registerAccessIndex = 10
    }
    
    func actionOnRegister(registerIndex : Int) {
        
        if registerIndex > 9 || registerIndex < 0 {
            return
        }
        
        registerAccessIndex = registerAccessIndex + registerIndex
        
        
        
        guard let delegate = delegate else {
            return
        }
        
        let xValue = delegate.getStackXValue()
        let registerValue = register [registerAccessIndex]
        
        var result = 0.0
        
        switch registerAccessOperation {
        case .Add:
            result = registerValue + xValue
            break
        case .Subtract:
            result = registerValue - xValue
            break
        case .Multiply:
            result = registerValue * xValue
            break
        case .Divide:
            result = registerValue / xValue
            break
        default:
            switch registerAccess {
            case .Store:
                result = xValue
                break
            case .Recall:
                result = registerValue
                break
            default :
                break
                    
            }
        }

        switch registerAccess {
        case .Store:
            register [registerAccessIndex] = result
            break
        case .Recall:
            delegate.setStackXValue(result)
            break
        default:
            break
        }
        
    }
    
}
