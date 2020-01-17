//
//  Double+Ext.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let divisior = pow(10, Double(fractionDigits))
        return (self * divisior).rounded() / divisior
    }
}
