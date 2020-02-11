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
            throw CalculationError.improperStatisticsOperation
        }
        
        let xValue = register[3] / register[2]
        let yValue = register[5] / register[2]

        delegate.setStackXValue(xValue, yValue: yValue)
    }
    
    func calculateStandardDeviation() throws {
        guard let delegate = delegate else {
            return
        }
        
        let n = Swift.abs(register[2])

        if n <= 1.0 {
            throw CalculationError.divisionByZero
        }
        
        let xSum = register[3]
        let xSquareSum = register[4]
        let ySum = register[5]
        let ySquareSum = register[6]
   //     let xMultiplySum = register[7]
        
        let mValue = n * xSquareSum - xSum * xSum
        let nValue = n * ySquareSum - ySum * ySum
   //     let pValue = n * xMultiplySum - xSum * ySum
        
        let sx = sqrt(mValue / (n * (n - 1)))
        let sy = sqrt(nValue / (n * (n - 1)))
          
        delegate.setStackXValue(sx, yValue: sy)
    }
}
