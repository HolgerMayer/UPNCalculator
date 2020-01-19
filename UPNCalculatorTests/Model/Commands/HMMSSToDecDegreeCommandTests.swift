//
//  HMMSSToDecDegreeCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 16.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class HMMSSToDecDegreeCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return HMMSSToDecDegreeCommand(calculatorEngine: engine, display: display)
    }

    func testHMMSSToDecDegreeCommandPushed() {
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        
        let _ = digit1Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit4Command.execute()
        let _ = digit0Command.execute()
        let _ = digit4Command.execute()
        
        let result = testObject.execute()
        
        XCTAssert(result == .Default)

        guard let xValue = engine.top else {
             XCTFail()
             return
        }
  
        // use different rounding because of strange rounding behaviour in extension with some values
        let checkValue = (xValue * 10000).rounded(.up) / 10000
        XCTAssertTrue(checkValue == 1.2345," xValue is \(checkValue)")

    }
    
      func testHMMSSToDecDegreeCommandSecondValuePushed() {
              let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
              let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
              let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
              let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
              let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
              
              let _ = digit1Command.execute()
              let _ = digit2Command.execute()
              let _ = dotCommand.execute()
              let _ = digit2Command.execute()
              let _ = digit0Command.execute()
              let _ = digit4Command.execute()
              let _ = digit2Command.execute()

              let result = testObject.execute()
              
              XCTAssert(result == .Default)

              guard let xValue = engine.top else {
                   XCTFail()
                   return
              }
        
              let checkValue = xValue.roundToDecimal(4)
              XCTAssertTrue(checkValue ==  12.345," xValue is \(checkValue)")

    }
}
