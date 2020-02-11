//
//  UPNEngine+RegisterControllerDelegate.swift
//  UPNCalculator
//
//  Created by holgermayer on 30.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

extension UPNEngine : RegisterControllerDelegate {

    
    func getStackXValue() -> Double {
        guard let value = stack.top else {
            return 0.0
        }
        
        return value
    }
    
    func setStackXValue(_ value: Double) {
        let _ = stack.pop()
        stack.push(value)
    }
    
    func getStackYValue() -> Double {
        guard let value = stack.peek(register: .Y) else {
            return 0.0
        }
        
        return value
    }
    
}

