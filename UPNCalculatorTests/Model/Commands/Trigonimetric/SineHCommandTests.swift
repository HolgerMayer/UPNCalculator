//
//  SineHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class SineHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return SineHCommand(calculatorEngine: engine, display: display)
    }

    
  
    func testDegSineHValues(){
           
        let testInputs : [Double] = [-229.1831,-171.8873,-114.5916,-57.2958,0,57.2958,114.5916,171.8873,229.1831]
        let expectedResults : [Double] = [-27.2899,-10.0179,-3.6269,-1.1752,0,1.1752,3.6269,10.0179,27.2899]
        
        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg sineh ",roundTo:4)

    }
    
 
    
}
