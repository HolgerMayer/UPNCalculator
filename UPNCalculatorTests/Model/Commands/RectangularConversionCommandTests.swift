//
//  RectangularConversionCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 10.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class RectangularConversionCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : RectangularConversionCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = RectangularConversionCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
 
    
    func testHandbookExample() {
        
        engine.trigonometricMode = .deg
        display.trigonometricMode = .deg
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand  = EnterCommand(calculatorEngine: engine, display: display)

        let _ = digit3Command.execute()
        let _ = digit0Command.execute()
        let _ = enterCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()

        let newState = testObject.execute()

        XCTAssert(newState == .Default)

        guard let xValue = engine.top else {
            XCTFail()
            return
        }
        

        var checkValue = xValue.roundToDecimal(4)
        XCTAssertTrue(checkValue == 10.3923," xValue is \(checkValue)")
        
        engine.removeTop()
        
        guard let yValue = engine.top else {
            XCTFail()
            return
        }

        checkValue = yValue.roundToDecimal(4)
        XCTAssertTrue(checkValue == 6.0," yValue is \(checkValue)")

    }
    
}
