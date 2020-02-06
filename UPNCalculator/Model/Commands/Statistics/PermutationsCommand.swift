//
//  PermutationsCommand.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class PermutationsCommand : CalculationCommand {
    
    override init(calculatorEngine: UPNEngine, display: Display) {
        super.init(calculatorEngine: calculatorEngine, display: display)
    }
    
    override  func callEngineCalculation() throws {
            try super.calculatorEngine.permutations()
    }
}
