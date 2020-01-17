//
//  DecDegreeToHMMSSCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 16.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import Foundation


class DecDegreeToHMMSSCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        super.calculatorEngine.decDegreeToHMMSSConversion()
        display.isPushed = true

    }
}
