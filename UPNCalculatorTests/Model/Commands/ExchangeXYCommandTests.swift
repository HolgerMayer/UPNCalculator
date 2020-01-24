//
//  ExchangeXYCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class ExchangeXYCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : ExchangeXYCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ExchangeXYCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExchangePushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit1Command.execute()
        
        let _ = enterCommand.execute()
        
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = digit2Command.execute()
        
    
        let _ = testObject.execute()
          
        guard let result1 = engine.top else {
                 XCTFail()
                 return
        }
        
        engine.removeTop()
        
        guard let result2 = engine.top else {
                XCTFail()
                return
        }
   
        engine.removeTop()
               
        guard let result3 = engine.top else {
                XCTFail()
                return
        }
        
        XCTAssertTrue(result1 == 232.0, "Should be 232 is \(result1)")
        XCTAssertTrue(result2 == 232.0, "Should be 232 is \(result2)")
        XCTAssertTrue(result3 == 121.0, "Should be 121 is \(result3)")
    }

    func testExchangeNotPushed() {
         
         let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
         let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
         let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
         let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
         
         let _ = digit1Command.execute()
         let _ = digit2Command.execute()
         let _ = digit1Command.execute()
         
         let _ = enterCommand.execute()
         
         let _ = digit2Command.execute()
         let _ = digit3Command.execute()
         let _ = digit2Command.execute()
         
            
         guard let result1 = engine.top else {
                  XCTFail()
                  return
         }
         
         engine.removeTop()
         
         guard let result2 = engine.top else {
                 XCTFail()
                 return
         }
    
         
         XCTAssertTrue(result1 == 232.0, "Should be 232 is \(result1)")
         XCTAssertTrue(result2 == 121.0, "Should be 121 is \(result2)")
     }
}
