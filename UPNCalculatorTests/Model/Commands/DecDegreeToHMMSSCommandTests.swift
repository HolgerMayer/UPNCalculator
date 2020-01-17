//
//  DecDegreeToHMMSSCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 16.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class DecDegreeToHMMSSCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return DecDegreeToHMMSSCommand(calculatorEngine: engine, display: display)
    }

    func testDegDegreeToHMMSSCommandPushed() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        
        let _ = digit1Command.execute()
        let _ = dotCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = digit4Command.execute()
        let _ = digit5Command.execute()
        
        let result = testObject.execute()
        
        XCTAssert(result == .Default)

        guard let xValue = engine.top else {
             XCTFail()
             return
        }
  
        let checkValue = xValue.roundToDecimal(4)
        XCTAssertTrue(checkValue == 1.1404," xValue is \(checkValue)")

    }
    
    func testDegDegreeToHMMSSCommandPushedSecondValue() {
          
          let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
          let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
          let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
          let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
          let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
          let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
          
          let _ = digit1Command.execute()
          let _ = digit2Command.execute()
          let _ = dotCommand.execute()
          let _ = digit3Command.execute()
          let _ = digit4Command.execute()
          let _ = digit5Command.execute()
          let _ = digit1Command.execute()

          let result = testObject.execute()
          
          XCTAssert(result == .Default)

          guard let xValue = engine.top else {
               XCTFail()
               return
          }
    
          let checkValue = xValue.roundToDecimal(4)
          XCTAssertTrue(checkValue ==  12.2042," xValue is \(checkValue)")

      }
}
