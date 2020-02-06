//
//  UPNEngine+Statistics.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

extension UPNEngine {
    
    func permutations()  throws {
        let x : Double = getNextNumber()
        let y : Double = getNextNumber()
        
        let temp = y - x

        let denominator = try MathTool.factorial(temp)
        
        let numerator = try MathTool.factorial(y)

        let result = numerator / denominator
        
        stack.push(result)
  }
    
    func combinations() throws {
        let x : Double = getNextNumber()
        let y : Double = getNextNumber()
        
        let temp = y - x

        let denominator1 = try MathTool.factorial(temp)
        let denominator2 = try MathTool.factorial(x)
        let denominator = denominator1 * denominator2
        
        let numerator = try MathTool.factorial(y)

        let result = numerator / denominator
          
        stack.push(result)
    }
    
}
