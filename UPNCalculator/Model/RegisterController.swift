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
    func getStackYValue() -> Double
    func setStackXValue(_ xValue : Double, yValue : Double)
}

class RegisterController {
    weak var delegate : RegisterControllerDelegate?

    var register = [Double](repeating : 0.0, count : 1000)
    var registerAccess : RegisterAccess = .None
    var registerAccessOperation : RegisterOperation = .None
    var registerAccessIndex : Int = 0
    
    init() {
    }
    
    func clear() {
        register = [Double](repeating : 0.0, count : 1000)
    }
    
    func clearStatisticRegisters() {
        register[2] = 0.0
        register[3] = 0.0
        register[4] = 0.0
        register[5] = 0.0
        register[6] = 0.0
        register[7] = 0.0
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
    
    func actionOnRegister(registerIndex : Int) throws {
        
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
        
        if registerAccess == .Store {
            switch registerAccessOperation {
            case .Add:
                result =   registerValue + xValue
                break
            case .Subtract:
                result = registerValue - xValue
                break
            case .Multiply:
                result = registerValue * xValue
                break
            case .Divide:
                if xValue == 0.0 {
                    registerAccess = .None
                    throw CalculationError.divisionByZero
                }
                result =  registerValue / xValue
                break
            default:
                result = xValue
            }
        } else if registerAccess == .Recall {
            switch registerAccessOperation {
              case .Add:
                  result =  xValue + registerValue
                  break
              case .Subtract:
                  result =  xValue - registerValue
                  break
              case .Multiply:
                  result =  xValue * registerValue
                  break
              case .Divide:
                  if registerValue == 0.0 {
                    registerAccess = .None
                    throw CalculationError.divisionByZero
                   }
                  result =  xValue / registerValue
                  break
              default:
                  result = registerValue
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
