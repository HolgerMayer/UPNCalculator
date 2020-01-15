//
//  GradCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class GradCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return GradCommand(calculatorEngine: engine, display: display)
    }

    func testGradCommandPushed() {
        
        let result = testObject.execute()
        XCTAssertTrue(result == .Default)
        
        // trigonometric mode Change -> Display connection is handled within CommandController class
      XCTAssertTrue(mockDelegate.delegate_didCall_didChangeTrigonometricMode)
        XCTAssertTrue(mockDelegate.delegate_param_Mode == .grad,"delegate param should be .grad is \(mockDelegate.delegate_param_Mode!.rawValue)")

    }
}
