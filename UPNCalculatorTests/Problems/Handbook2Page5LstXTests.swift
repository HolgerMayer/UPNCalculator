//
//  Handbook2Page5LstXTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class Handbook2Page5LstXTests: XCTestCase {

    var engine : UPNEngine!
     var display : CalculatorDisplay!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         
         engine = UPNEngine()
         display = CalculatorDisplay()
     }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testHandbookPage25LstXProblem() {
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = dotCommand.execute()
        let _ = digit4Command.execute()
        let _ = digit5Command.execute()
        let _ = digit6Command.execute()
        let _ = digit7Command.execute()

        let intCommand = IntCommand(calculatorEngine: engine, display: display)
        let _ = intCommand.execute()

        guard let value1 = display.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(abs(value1 - 123.0) <= 0.00001)

        let lastXCommand = LastXCommand(calculatorEngine: engine, display: display)
        let _ = lastXCommand.execute()
        
        guard let value2 = display.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(abs(value2 - 123.4567) <= 0.00001,"Value should be 123.4567 is \(value2) ")
        
        let chsCommand = ChangeSignCommand(calculatorEngine: engine, display: display)
        let _ = chsCommand.execute()
        
        let _ = intCommand.execute()
        
        guard let value3 = display.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(abs(value3 + 123.0) <= 0.00001)
          
        let _ = lastXCommand.execute()
        
        guard let value4 = display.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(abs(value4 + 123.4567) <= 0.00001,"Value should be -123.4567 is \(value4) ")

        let fracCommand = FracCommand(calculatorEngine: engine, display: display)
        let _ = fracCommand.execute()
  
        guard let value5 = display.value else {
            XCTFail()
            return
        }
     
        XCTAssertTrue(abs(value5 + 0.4567) <= 0.00001, "Value should be -0.4567 is \(value5) ")

    
    }

   

}
