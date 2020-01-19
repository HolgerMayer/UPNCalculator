//
//  RectangularConversionCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 10.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class RectangularConversionCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
        super.calculatorEngine.rectangularConversion()
        display.isPushed = true

    }
}
