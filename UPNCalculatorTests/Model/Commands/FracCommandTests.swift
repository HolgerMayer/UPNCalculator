//
//  FracCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class FracCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : FracCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = FracCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFracNotPushed() {
        
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
        
               
        XCTAssertTrue(result - 0.123 <= 0.00001, "Should be 0.123 is \(result)")

    }
    
    func testFracPushed() {
           
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
           
                  
        XCTAssertTrue(result1  - 0.123 <= 0.00001, "Should be 0.123 is \(result1)")
       
        guard let result2 = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result2  - 0.123 <= 0.00001, "Should be 0.123 is \(result2)")

    }
}
