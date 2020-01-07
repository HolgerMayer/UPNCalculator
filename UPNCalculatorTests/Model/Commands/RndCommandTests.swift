//
//  RndCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class RndCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : RndCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = RndCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupTestValue(){
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
        let enterCommand  = EnterCommand(calculatorEngine: engine, display: display)

        let _ = digit1Command.execute()
        let _ = dotCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = digit4Command.execute()
        let _ = digit5Command.execute()
        let _ = digit6Command.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = digit9Command.execute()

        let _ = enterCommand.execute()
    }
    
    
    func testFixRnd() {
        
        setupTestValue()
        display.inputMode = .fix
        display.noOfDecimalPlacesDisplayed = 4
        
        let newState = testObject.execute()
        
        display.noOfDecimalPlacesDisplayed = 6
        
        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        XCTAssertTrue(display.value! == 1.2346,"display value is \(display.value!)")
    
    }
    
      func testSciRnd() {
         setupTestValue()
           display.inputMode = .scientific
           display.noOfDecimalPlacesDisplayed = 4
           
           let newState = testObject.execute()
           
           display.noOfDecimalPlacesDisplayed = 6
           
           XCTAssert(newState == .Default)
           XCTAssertNotNil(display.value)
           XCTAssertTrue(display.value! == 1.2346,"display value is \(display.value!)")
       }
    
      func testEngRnd() {
        setupTestValue()
        display.inputMode = .engineering
        display.noOfDecimalPlacesDisplayed = 4
        
        let newState = testObject.execute()
        
        display.noOfDecimalPlacesDisplayed = 6
        
        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        XCTAssertTrue(display.value! == 1.2346,"display value is \(display.value!)")
       }
}
