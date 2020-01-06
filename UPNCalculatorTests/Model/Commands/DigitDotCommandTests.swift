//
//  DigitDotCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 12.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class DigitDotCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : DigitDotCommand!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testEnterDigit() {
         display.clear()
         display.addBaseDigit(digit: "1")
         display.addBaseDigit(digit: "2")

         testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : "3")
        
        let _ = testObject.execute()
        
        guard let result = display.value else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.0)
    }
    
    
    func testEnterDot() {
        display.clear()
        display.addBaseDigit(digit: "1")
        display.addBaseDigit(digit: "2")
        display.addBaseDigit(digit: "3")

        testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : ".")

        let fourCommand = DigitDotCommand(calculatorEngine: engine, display: display,token : "4")
        

        let _ = testObject.execute()
        let _ = fourCommand.execute()
        
        guard let result = display.value else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.4,"result should be 123.4 is \(result)")

        
    }
    
    func testFixInputModeReturnToStandardMode() {
         display.clear()
         display.addBaseDigit(digit: "1")
         display.addBaseDigit(digit: "2")
         display.addBaseDigit(digit: "3")

         display.inputMode = .fix
        
         testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : "1")

         let _ = testObject.execute()
         
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeState)
        XCTAssertTrue(mockDelegate.delegate_param_State! == .Default)
         
     }
    
      func testScientificInputModeReturnToStandardMode() {
        
        display.clear()
        display.addBaseDigit(digit: "1")
        display.addBaseDigit(digit: "2")
        display.addBaseDigit(digit: "3")

        display.inputMode = .scientific
             
        testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : "1")

        let _ = testObject.execute()
                     
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeState)
        XCTAssertTrue(mockDelegate.delegate_param_State! == .Default)

              
    }
    
}


