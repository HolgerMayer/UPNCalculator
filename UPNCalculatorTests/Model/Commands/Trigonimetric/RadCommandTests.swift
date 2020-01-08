//
//  RadCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class RadCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : RadCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = RadCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDegCommandPushed() {
        
        
        let result = testObject.execute()
        XCTAssertTrue(result == .Default)
        
        
        // trigonometric mode Change -> Display connection is handled within CommandController class
      XCTAssertTrue(mockDelegate.delegate_didCall_didChangeTrigonometricMode)
        XCTAssertTrue(mockDelegate.delegate_param_Mode == .rad,"delegate param should be .rad is \(mockDelegate.delegate_param_Mode!.rawValue)")

    }
}
