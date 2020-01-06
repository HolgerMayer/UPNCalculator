//
//  FCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class FCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : FCommand!
    var mockDelegate : DisplayMockDelegate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        mockDelegate = DisplayMockDelegate()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = FCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFCommandPushed() {
        
        
        let result = testObject.execute()
        XCTAssertTrue(result == .FState)
        
        
        // State Change -> Display connection is handled within CommandController class
        
        XCTAssertFalse(mockDelegate.delegate_didCall_didChangeState)
        XCTAssertNil(mockDelegate.delegate_param_State)

    }
}
