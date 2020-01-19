//
//  SineHCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

import Foundation


class SineHCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
            super.calculatorEngine.sinh()
    }
}
