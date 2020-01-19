//
//  TrigonometricConverter.swift
//  UPNCalculator
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class TrigonometricConverter {
    
    static func convertDegToRad( _ value : Double) -> Double {
        return Double.pi * value / 180.0
    }
    
    static func convertRadToDeg(_ value : Double) -> Double {
        return value * 180.0 / Double.pi
    }
    
    static func convertGradToRad(_ value : Double) -> Double {
        return  0.0157079633 * value
    }
    
    static func convertRadToGrad(_ value : Double) -> Double {
        return 63.6619772368 * value
    }
}
