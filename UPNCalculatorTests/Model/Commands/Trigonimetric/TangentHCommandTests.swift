//
//  TangentHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class TangentHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return TangentHCommand(calculatorEngine: engine, display: display)
    }
  
    func testDegTangentHValues(){
           
        let testInputs : [Double] = [-229.1831,-171.8873,-114.5916,-57.2958,0,57.2958,114.5916,171.8873,229.1831]
        let expectedResults : [Double] = [-0.9993,-0.9951,-0.964,-0.7616,0,0.7616,0.964,0.9951,0.9993]
        
        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg tangenth ",roundTo:4)

    }
    
   
    
}
