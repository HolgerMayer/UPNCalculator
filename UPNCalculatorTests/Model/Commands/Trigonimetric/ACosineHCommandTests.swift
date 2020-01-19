//
//  ACosineHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class ACosineHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return ACosineHCommand(calculatorEngine: engine, display: display)
    }
  
    func testDegCosineHValues(){
           
        let testInputs : [Double] = [1,1.5431,3.7622,10.0677,27.3082]
        let expectedResults : [Double] = [0,57,115,172,229]
        
        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg acosineh ",roundTo:0)

    }
    
  
    
}
