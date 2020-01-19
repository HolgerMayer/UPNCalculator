//
//  ASineHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class ASineHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return ASineHCommand(calculatorEngine: engine, display: display)
    }
  
    func testDegASineHValues(){
           
        let testInputs : [Double] = [-27.2899,-10.0179,-3.6269,-1.1752,0,1.1752,3.6269,10.0179,27.2899]
        let expectedResults : [Double] = [-229,-172,-115,-57,0,57,115,172,229]
        
        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg asineh ",roundTo:0)

    }
    
   
    
}
