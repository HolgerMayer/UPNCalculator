//
//  FactorialCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class FactorialCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : FactorialCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = FactorialCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFactorialOfNegativeNumber() {
        let chsCommand = ChangeSignCommand(calculatorEngine: engine, display: display)
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
           
        let _ = digit1Command.execute()
        let _ = chsCommand.execute()
        
         let newState = testObject.execute()
         
         XCTAssert(newState == .Default)
         XCTAssertNotNil(display.value)
         
         XCTAssertTrue(display.value! == -1,"display value is \(display.value!)")
         XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplayToError)
        XCTAssertTrue(mockDelegate.delegate_param1 == "Error : factorial from negative number", "delegate_param was \(mockDelegate.delegate_param1)")
     }

    
    func testFactorialOfZero() {
         let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
          
        let _ = digit0Command.execute()
        
        let newState = testObject.execute()
        
        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        
        XCTAssertTrue(display.value! == 1,"display value is \(display.value!)")
    }
    
     func testFactorialOfOne() {
           let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
    
          let _ = digit1Command.execute()
          
          let newState = testObject.execute()
          
          XCTAssert(newState == .Default)
          XCTAssertNotNil(display.value)
          
          XCTAssertTrue(display.value! == 1,"display value is \(display.value!)")
      }

    func testFactorialOfSeven() {
            let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
     
           let _ = digit7Command.execute()
           
           let newState = testObject.execute()
           
           XCTAssert(newState == .Default)
           XCTAssertNotNil(display.value)
           
           XCTAssertTrue(display.value! == 5040,"display value is \(display.value!)")
       }
    
    func testFactorialOfOnethousand() {
             let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
             let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
       
             
             let _ = digit1Command.execute()
             let _ = digit0Command.execute()
             let _ = digit0Command.execute()
             let _ = digit0Command.execute()

             let _ = testObject.execute()
             
            XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplayToError)
            XCTAssertTrue(mockDelegate.delegate_param1 ==  "Error : result to large", "delegate_param was \(mockDelegate.delegate_param1)")
         }
}
