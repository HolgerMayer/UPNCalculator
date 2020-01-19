//
//  RadCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

import XCTest
@testable import UPNCalculator

class RadCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return RadCommand(calculatorEngine: engine, display: display)
    }

    func testRadCommandPushed() {
        
        
        let result = testObject.execute()
        XCTAssertTrue(result == .Default)
        
        
        // trigonometric mode Change -> Display connection is handled within CommandController class
      XCTAssertTrue(mockDelegate.delegate_didCall_didChangeTrigonometricMode)
        XCTAssertTrue(mockDelegate.delegate_param_Mode == .rad,"delegate param should be .rad is \(mockDelegate.delegate_param_Mode!.rawValue)")

    }
}
