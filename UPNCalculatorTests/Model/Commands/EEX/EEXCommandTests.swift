//
//  EEXCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class EEXCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : EEXCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = EEXCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEEXCommandPushed() {
        
        display.value = 1.2
        
        let result = testObject.execute()
        
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     00".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
   
    }
    
    func testNegativeExponentValuePushed() {
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")

        let eexDigit3Command = EEX1Command(calculatorEngine: engine, display: display, token: "3")
        let eexDigit4Command = EEX1Command(calculatorEngine: engine, display: display, token: "4")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let eexCommand = EEXCommand(calculatorEngine: engine, display: display)
        let chsCommand = EEXChangeSignCommand(calculatorEngine: engine, display: display)
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let multiplyCommand = MultiplyCommand(calculatorEngine: engine, display: display)
        
        let _ = digit6Command.execute()
        let _ = dotCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit2Command.execute()
        let _ = digit6Command.execute()
        let _ = digit2Command.execute()
        let _ = eexCommand.execute()
        let _ = eexDigit3Command.execute()
        let _ = eexDigit4Command.execute()
        let _ = chsCommand.execute()
        let _ = enterCommand.execute()
        
        XCTAssertEqual(display.value, 6.6262*pow(10,-34))
        XCTAssertEqual(engine.top! , 6.6262*pow(10,-34))
        
        let _ = digit5Command.execute()
        let _ = digit0Command.execute()
        
        let _ = multiplyCommand.execute()
        
        XCTAssertNotNil(display.value)
        XCTAssertEqual(display.value!, 3.3131*pow(10,-32), accuracy: 0.0001)
        XCTAssertEqual(engine.top! , 3.3131*pow(10,-32), accuracy: 0.0001)

        
    }
}
