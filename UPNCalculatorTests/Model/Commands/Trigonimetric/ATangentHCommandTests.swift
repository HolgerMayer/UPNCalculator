//
//  ATangentHCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class ATangentHCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return ATangentHCommand(calculatorEngine: engine, display: display)
    }
  
    func testDegATangentHValues(){
           
        let testInputs : [Double] = [-0.9993293,-0.9950548,-0.9640276,-0.7615942,0,0.76159416,0.96402758,0.99505475,0.9993293]
        let expectedResults : [Double] = [-229,-172,-115,-57,0,57,115,172,229]

        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg atangenth ",roundTo:0)

    }
    
   
    
}
