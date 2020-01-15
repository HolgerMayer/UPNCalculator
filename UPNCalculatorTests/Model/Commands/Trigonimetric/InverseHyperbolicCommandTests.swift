//
//  InverseHyperbolicCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class InverseHyperbolicCommandTests: CommandTestCase {

override func createTestObject() -> Command? {
    return InverseHyperbolicCommand(calculatorEngine: engine, display: display)
}
    
    func testHypCommandPushed() {
        
        
        let result = testObject.execute()
        XCTAssertTrue(result == .INVHYPERBOLIC)
  
    }
}
