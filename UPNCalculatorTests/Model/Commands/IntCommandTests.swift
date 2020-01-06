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
    
    func testIntNotPushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()

        let _ = testObject.execute()
          
        guard let result = display.value else {
                 XCTFail()
                 return
        }
        
               
        XCTAssertTrue(result == 123.0, "Should be 123 is \(result)")

    }
    
    func testIntPushed() {
           
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
           
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        
        let _ = testObject.execute()
             
        guard let result1 = display.value else {
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
