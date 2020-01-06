//
//  EEXBackArrowCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class EEXBackArrowCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : EEXBackArrowCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = EEXBackArrowCommand(calculatorEngine: engine, display: display)

     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEEXBackArrowCommandPushed() {
        let exxDigit2 = EEX1Command(calculatorEngine: engine, display: display,token:"2")
        let exxDigit3 = EEX1Command(calculatorEngine: engine, display: display,token:"3")

        display.value = 1.2
        display.initializeExponentEntry()
        
        let _ = exxDigit2.execute()
        let _ = exxDigit3.execute()

        mockDelegate.resetDelegate()
            
        var result = testObject.execute()
        
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertTrue(mockDelegate.delegate_param1 == "1.2     02","delegate param should be 1.2.....02 is \(mockDelegate.delegate_param1)")

        mockDelegate.resetDelegate()

        result = testObject.execute()
        
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertTrue(mockDelegate.delegate_param1 == "1.2     00","delegate param should be 1.2.....00 is \(mockDelegate.delegate_param1)")

   
    }
}

