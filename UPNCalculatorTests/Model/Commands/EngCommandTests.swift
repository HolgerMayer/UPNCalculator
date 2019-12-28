//
//  EngCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 23.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class EngCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : EngCommand!
    
    var delegate_didCall_didChangeDisplay : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 = ""
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = self
        testObject = EngCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func resetDelegateMonitor(){
            delegate_didCall_didChangeDisplay = false
            delegate_didCall_didChangeState  = false
            delegate_param1 = ""
        }
  
    func testChangeDecimalDigits() {
        
            let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
            let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
            let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
            let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
            let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
            let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
            let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
            let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
            let digit8Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "8")
            let digit9Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "9")
            let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
            let enterCommand = EnterCommand(calculatorEngine: engine, display: display)

            digit1Command.execute()
            digit2Command.execute()
            digit3Command.execute()
            digit4Command.execute()
            digit5Command.execute()
            digit6Command.execute()
            digit7Command.execute()
            digit8Command.execute()
            digit9Command.execute()
            digit0Command.execute()
            digit1Command.execute()
            digit2Command.execute()
            dotCommand.execute()
            digit0Command.execute()
 
            enterCommand.execute()
                
            
            
            testObject.execute()
            digit0Command.execute()
        
            XCTAssertTrue(delegate_didCall_didChangeDisplay)
            XCTAssertTrue(delegate_param1 == "100      09", "delegate_param_digits should be 100 is \(delegate_param1)")
 
            resetDelegateMonitor()
            
            testObject.execute()
            digit4Command.execute()
        
            XCTAssertTrue(delegate_didCall_didChangeDisplay)
            XCTAssertTrue(delegate_param1 == "123.46   09", "delegate_param_digits should be 123.46   09 is \(delegate_param1)")
           
 
    }
    
}

extension EngCommandTests : DisplayDelegate
{

    func didChangeDisplay(value: String) {
        delegate_didCall_didChangeDisplay = true
        delegate_param1 = value
    }
   
    
   func didChangeState(_ state: KeyboardState) {
    delegate_didCall_didChangeState = true
   }

}
