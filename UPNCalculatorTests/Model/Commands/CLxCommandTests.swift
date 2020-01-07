//
//  CLxCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation



import XCTest
@testable import UPNCalculator

class CLxCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : CLxCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = CLxCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testCLxStack() {
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")

 
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        
         
        let newState = testObject.execute()
        
        XCTAssert(newState == .Default)
        XCTAssertNil(display.value)
        XCTAssertFalse(display.isPushed)
    }
    
}
