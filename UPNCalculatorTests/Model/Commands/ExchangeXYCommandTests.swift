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
    
    func testExchange() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        
        digit1Command.execute()
        digit2Command.execute()
        digit1Command.execute()
        
        enterCommand.execute()
        
        digit2Command.execute()
        digit3Command.execute()
        digit2Command.execute()
        
    
        testObject.execute()
          
        guard let result1 = display.value() else {
                 XCTFail()
                 return
        }
        
        guard let result2 = engine.top else {
                XCTFail()
                return
        }
               
        XCTAssertTrue(result1 == 121.0, "Should be 121 is \(result1)")
        XCTAssertTrue(result2 == 232.0, "Should be 232 is \(result2)")
    
         
        
    }

    
}
