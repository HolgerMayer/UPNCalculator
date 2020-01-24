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
    
    func testBackArrowNotPushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()

        let _ = testObject.execute()
          
        guard let result1 = display.value else {
                 XCTFail()
                 return
        }
        
               
        XCTAssertTrue(result1 == 12.0, "Should be 12 is \(result1)")
    
        let _ = testObject.execute()
                
        guard let result2 = display.value else {
                XCTFail()
                return
        }
              
                     
        XCTAssertTrue(result2 == 1, "Should be 1 is \(result2)")
        
    }
    
    func testBackArrowPushed() {
           
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
           
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        
        let _ = testObject.execute()
             
        guard let result1 = display.value else {
                XCTFail()
                return
        }
           
                  
        XCTAssertTrue(result1 == 0.0, "Should be 0 is \(result1)")
       
    }
    
    func testBackArrowPushedEnteredNextDigit() {
             
          let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
          let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
          let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
          let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
             
          let _ = digit1Command.execute()
          let _ = digit2Command.execute()
          let _ = digit3Command.execute()
          let _ = enterCommand.execute()
          
          let _ = testObject.execute()
    
          let _ = digit1Command.execute()

          guard let result1 = display.value else {
                  XCTFail()
                  return
          }
             
                    
         XCTAssertEqual(result1 ,1.0)
         
      }
}
