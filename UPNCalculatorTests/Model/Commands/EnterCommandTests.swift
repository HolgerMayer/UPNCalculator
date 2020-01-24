//
//  EnterCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 13.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class EnterCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : EnterCommand!


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = EnterCommand(calculatorEngine: engine, display: display)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnterNumberToStack() {
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")

        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()

        XCTAssertFalse(display.isPushed)
        XCTAssertEqual(engine.top,123.12)
        
        let _ = testObject.execute()
        
        XCTAssertTrue(display.isPushed)
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.12)
        
    }

  

}

