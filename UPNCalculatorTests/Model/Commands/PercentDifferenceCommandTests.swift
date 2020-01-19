//
//  PercentDifferenceCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 07.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class PercentDifferenceCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : PercentDifferenceCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = PercentDifferenceCommand(calculatorEngine: engine, display: display)
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
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")

        let gCommand = GCommand(calculatorEngine: engine, display: display)
        
        let _ = digit1Command.execute()
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        
        let _ = gCommand.execute()
        let newState = testObject.execute()
        
        XCTAssert(newState == .Default)
        XCTAssertNotNil(display.value)
        
        let checkValue = display.value!.roundToDecimal(display.noOfDecimalPlacesDisplayed)
        XCTAssertTrue(checkValue == -10.4061,"display value is \(checkValue)")
  


    }
    
}
