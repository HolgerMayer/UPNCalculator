//
//  PercentCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class PercentCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : PercentCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = PercentCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func setupBaseValue(){
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
      
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let enterCommand  = EnterCommand(calculatorEngine: engine, display: display)

        let _ = digit1Command.execute()
        let _ = digit5Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit6Command.execute()

        let _ = enterCommand.execute()
    }
    
    
    func testHandbookExample() {
        
        setupBaseValue()
        
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let gCommand = GCommand(calculatorEngine: engine, display: display)
        let addCommand = AddCommand(calculatorEngine: engine, display: display)
        
        let _ = digit3Command.execute()
        let _ = gCommand.execute()
        let newState = testObject.execute()
        
        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        XCTAssertTrue(display.value! == 0.4728,"display value is \(display.value!)")
        
        let _ = addCommand.execute()

        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        XCTAssertTrue(display.value! == 16.2328,"display value is \(display.value!)")

    }
    
}
