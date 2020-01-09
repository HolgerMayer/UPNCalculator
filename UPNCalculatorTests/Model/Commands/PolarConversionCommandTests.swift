//
//  PolarConversionCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 10.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class PolarConversionCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate :DisplayMockDelegate!
    var testObject : PolarConversionCommand!
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = PolarConversionCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
 
    
    func testHandbookExample() {
        
        engine.trigonometricMode = .deg
        display.trigonometricMode = .deg
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let enterCommand  = EnterCommand(calculatorEngine: engine, display: display)

        let _ = digit5Command.execute()
        let _ = enterCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit0Command.execute()

        let newState = testObject.execute()

        XCTAssert(newState == .Default)

        guard let radius = engine.top else {
            XCTFail()
            return
        }
        

        var checkValue = radius.roundToDecimal(4)
        XCTAssertTrue(checkValue == 11.1803," radius is \(checkValue)")
        
        engine.removeTop()
        
        guard let angle = engine.top else {
            XCTFail()
            return
        }

        checkValue = angle.roundToDecimal(4)
        XCTAssertTrue(checkValue == 26.5651," angle is \(checkValue)")

    }
    
}
