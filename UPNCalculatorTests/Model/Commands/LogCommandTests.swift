//
//  LogCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class LogCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : LogCommand!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = LogCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // Should result in Error!!!
    func testLogOfEmptyStack() {

        let _ = testObject.execute()
        
        let result = engine.top

        XCTAssertNil(result)
        XCTAssertTrue(mockDelegate.delegate_param1 == "Error : ln from zero")
    }

    func testLogEonStack() {
        engine.enterNumber(2.7183)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(1 - result) < 0.0001)
    }

}

