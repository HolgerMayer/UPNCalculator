//
//  CosineHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class CosineHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return CosineHCommand(calculatorEngine: engine, display: display)
    }

    
  
    func testDegCosineHValues(){

        let testInputs : [Double] = [-229.1831,-171.8873,-114.5916,-57.2958,0,57.2958,114.5916,171.8873,229.1831]
        let expectedResults : [Double] = [27.3082,10.0677,3.7622,1.5431,1,1.5431,3.7622,10.0677,27.3082]
        
        engine.trigonometricMode = .deg
        
         
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg cosineh ",roundTo:4)

    }
    
   
    
}
