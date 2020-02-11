//
//  RegisterController+Statistics.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

extension RegisterController {
    
    func sumAdd() {
        
        guard let delegate = delegate else {
            return
        }
        
        let x = delegate.getStackXValue()
        let y = delegate.getStackYValue()
        
        register[2] = register[2] + 1
        register[3] = register[3] + x
        register[4] = register[4] + x * x
        register[5] = register[5] + y
        register[6] = register[6] + y * y
        register[7] = register[7] + x * y

    }
    
    
    func sumSubtract(){
        
        guard let delegate = delegate else {
             return
        }
        
        let x = delegate.getStackXValue()
        let y = delegate.getStackYValue()

        register[2] = register[2] - 1
        register[3] = register[3] - x
        register[4] = register[4] - x * x
        register[5] = register[5] - y
        register[6] = register[6] - y * y
        register[7] = register[7] - x * y

    }
    
    func calculateMean() throws {
        guard let delegate = delegate else {
            return
        }
        
        if register[2] == 0 {
            throw CalculationError.divisionByZero
        }
        
        let xValue = register[3] / register[2]
        let yValue = register[5] / register[2]

        delegate.setStackXValue(xValue, yValue: yValue)
    }
    
}
