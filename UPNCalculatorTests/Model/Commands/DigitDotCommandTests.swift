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
    var testObject : DigitDotCommand!
    
    var delegate_didCall_didChangeBase  : Bool = false
    var delegate_didCall_didChangeExponent : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 : String = ""
    var delegate_resultValue : String = ""

    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = self
     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testEnterDigit() {
         display.clear()
         display.addBaseDigit(digit: "1")
         display.addBaseDigit(digit: "2")

         testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : "3")
        
        testObject.execute()
        
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
        

        testObject.execute()
        fourCommand.execute()
        
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

         testObject.execute()
         
        XCTAssertTrue(display.inputMode == .standard)

         
     }
    
      func testScientificInputModeReturnToStandardMode() {
              display.clear()
              display.addBaseDigit(digit: "1")
              display.addBaseDigit(digit: "2")
              display.addBaseDigit(digit: "3")

              display.inputMode = .scientific
             
              testObject = DigitDotCommand(calculatorEngine: engine, display: display,token : "1")

              testObject.execute()
              
             XCTAssertTrue(display.inputMode == .standard)

              
          }
    
}



extension DigitDotCommandTests : DisplayDelegate {
    func didChangeBase(value: String) {
        delegate_didCall_didChangeBase = true
        delegate_param1 = value
    }
    
    func didChangeExponent(value: String) {
        delegate_didCall_didChangeExponent = true
        delegate_param1 = value
    }
    
      func didChangeState(_ state: KeyboardState) {
      delegate_didCall_didChangeState = true
     }

    
    
}
