//
//  IntCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class IntCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : IntCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = IntCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExchangeNotPushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        
        digit1Command.execute()
        digit2Command.execute()
        digit3Command.execute()
        dotCommand.execute()
        digit1Command.execute()
        digit2Command.execute()
        digit3Command.execute()

        testObject.execute()
          
        guard let result = display.value() else {
                 XCTFail()
                 return
        }
        
               
        XCTAssertTrue(result == 123.0, "Should be 123 is \(result)")

    }
    
    func testExchangePushed() {
           
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
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
        
        testObject.execute()
             
        guard let result1 = display.value() else {
                XCTFail()
                return
        }
           
                  
        XCTAssertTrue(result1 == 123.0, "Should be 123 is \(result1)")
       
        guard let result2 = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result2 == 123.0, "Should be 123 is \(result2)")

    }
}
