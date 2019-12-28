//
//  FixCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 21.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class FixCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : FixCommand!
    
    var delegate_didCall_didChangeDisplay : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 = ""

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = self
        
        testObject = FixCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testFixChangeDecimalDigits() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
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
        XCTAssertTrue(delegate_param1 == "123.1230   ", "delegate_param_digits should be 123.1230    is \(delegate_param1)")
        delegate_didCall_didChangeDisplay = false
        
        
        testObject.execute()
        
        digit1Command.execute()
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "123.1      ", "delegate_param_digits should be 123.1230 is \(delegate_param1)")

        delegate_didCall_didChangeDisplay = false
        
        
        testObject.execute()
        
        digit7Command.execute()
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "123.1230000", "delegate_param_digits should be 123.1230 is \(delegate_param1)")

    }
    
    func testFixChangeFormat() {
          
          let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
          let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
          let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
          let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
          let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
          let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
          let sciCommand = SciCommand(calculatorEngine: engine, display: display)
          digit1Command.execute()
          digit2Command.execute()
          digit3Command.execute()
          dotCommand.execute()
          digit1Command.execute()
          digit2Command.execute()
          digit3Command.execute()

        
          enterCommand.execute()
              
          XCTAssertTrue(delegate_didCall_didChangeDisplay)
          XCTAssertTrue(delegate_param1 == "123.1230   ", "delegate_param_digits should be 123.1230 is \(delegate_param1)")
          delegate_didCall_didChangeDisplay = false

        
          
          sciCommand.execute()
          
          digit1Command.execute()

          delegate_didCall_didChangeDisplay = false
          
          
          testObject.execute()
          
          digit7Command.execute()
          XCTAssertTrue(delegate_didCall_didChangeDisplay)
          XCTAssertTrue(delegate_param1 == "123.1230000", "delegate_param_digits should be 123.1230 is \(delegate_param1)")

      }
    
}


extension FixCommandTests : DisplayDelegate
{

    func didChangeDisplay(value: String) {
        delegate_didCall_didChangeDisplay = true
        delegate_param1 = value
    }
    

   func didChangeState(_ state: KeyboardState) {
    delegate_didCall_didChangeState = true
   }

}
