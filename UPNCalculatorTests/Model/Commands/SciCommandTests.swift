//
//  SciCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class SciCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SciCommand!
    
    var delegate_didCall_didChangeDisplay  : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 = ""

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = self
        testObject = SciCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
  
    func testChangeDecimalDigits() {
        
            let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
            let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
            let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
            let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
            let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
            let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
            let enterCommand = EnterCommand(calculatorEngine: engine, display: display)

            digit1Command.execute()
            digit2Command.execute()
            digit3Command.execute()
            dotCommand.execute()
            digit1Command.execute()
            digit2Command.execute()
            digit3Command.execute()

            enterCommand.execute()
                
            XCTAssertTrue(delegate_didCall_didChangeDisplay)
            XCTAssertTrue(delegate_param1 == "123.1230   ", "delegate_param1 should be 123.1230 is \((delegate_param1 == "123.1230", "delegate_param1 should be 123.1230 is \(delegate_param1)"))")
            delegate_didCall_didChangeDisplay = false
            
            
            testObject.execute()
            
            digit4Command.execute()
            XCTAssertTrue(delegate_didCall_didChangeDisplay)
            XCTAssertTrue(delegate_param1 == "1.2312   02", "delegate_param1 should be 1.231 is \(delegate_param1)")
 
        
            delegate_didCall_didChangeDisplay = false
            
            
            testObject.execute()
            
            digit7Command.execute()
            XCTAssertTrue(delegate_didCall_didChangeDisplay)
            XCTAssertTrue(delegate_param1 == "1.231230 02", "delegate_param1 should be 1.231230 is \(delegate_param1)")

         

    }
    
}

extension SciCommandTests : DisplayDelegate
{

    func didChangeDisplay(value: String) {
        delegate_didCall_didChangeDisplay = true
        delegate_param1 = value
    }
    
   func didChangeState(_ state: KeyboardState) {
    delegate_didCall_didChangeState = true
   }

}
