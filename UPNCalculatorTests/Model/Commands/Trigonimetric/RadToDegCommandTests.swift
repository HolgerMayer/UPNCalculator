//
//  RadToDegCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 09.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class RadToDegCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return RadToDegCommand(calculatorEngine: engine, display: display)
    }


     func testRadToDegValues(){
            
        let testInputs : [Double] = [0,0.3491,0.6109,1.3090,1.7453, 2.5307,4.3633,5.0615,5.4105,6.1959]
        let expectedResults : [Double] = [0,20,35,75,100,145,250,290,310,355]

        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "RadToDeg", roundTo: 0)
       
         
     }
    
}
