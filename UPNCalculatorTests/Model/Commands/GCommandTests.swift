//
//  GCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class GCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : GCommand!
    var mockDelegate : DisplayMockDelegate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        mockDelegate = DisplayMockDelegate()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = GCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGCommandPushed() {
        
          
            let result = testObject.execute()
            XCTAssertTrue(result == .GState)
            
            
            // State Change -> Display connection is handled within CommandController class
            
            XCTAssertFalse(mockDelegate.delegate_didCall_didChangeState)
            XCTAssertNil(mockDelegate.delegate_param_State)
   
    }
}
