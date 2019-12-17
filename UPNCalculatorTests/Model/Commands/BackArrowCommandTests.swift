//
//  BackArrowCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class BackArrowCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : BackArrowCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = BackArrowCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExchangeNotPushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        
        digit1Command.execute()
        digit2Command.execute()
        digit3Command.execute()

        testObject.execute()
          
        guard let result1 = display.value() else {
                 XCTFail()
                 return
        }
        
               
        XCTAssertTrue(result1 == 12.0, "Should be 12 is \(result1)")
    
        testObject.execute()
                
        guard let result2 = display.value() else {
                XCTFail()
                return
        }
              
                     
        XCTAssertTrue(result2 == 1, "Should be 1 is \(result2)")
        
    }
    
    func testExchangePushed() {
           
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
           
        digit1Command.execute()
        digit2Command.execute()
        digit3Command.execute()
        enterCommand.execute()
        
        testObject.execute()
             
        guard let result1 = display.value() else {
                XCTFail()
                return
        }
           
                  
        XCTAssertTrue(result1 == 0.0, "Should be 0 is \(result1)")
       
    }
}
