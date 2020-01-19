//
//  EEXChangeSignCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class EEXChangeSignCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : EEXChangeSignCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = EEXChangeSignCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEEXChangeSignCommandPushed() {
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
         XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     -23".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         mockDelegate.resetDelegate()

         result = testObject.execute()
         
         XCTAssertTrue(result == .EEX1)
         XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
         XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     23".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

    }
}
