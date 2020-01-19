//
//  EngCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 23.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class EngCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : EngCommand!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate.resetDelegate()
        display.delegate = mockDelegate
        testObject = EngCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func resetDelegateMonitor(){
        mockDelegate.resetDelegate()
    }
  
    func testChangeDecimalDigits() {
        
            let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
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
            let enterCommand = EnterCommand(calculatorEngine: engine, display: display)

            let numFormat0Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "0")
            let numFormat4Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "4")

            let _ = digit1Command.execute()
            let _ = digit2Command.execute()
            let _ = digit3Command.execute()
            let _ = digit4Command.execute()
            let _ = digit5Command.execute()
            let _ = digit6Command.execute()
            let _ = digit7Command.execute()
            let _ = digit8Command.execute()
            let _ = digit9Command.execute()
            let _ = digit0Command.execute()
            let _ = digit1Command.execute()
            let _ = digit2Command.execute()
            let _ = dotCommand.execute()
            let _ = digit0Command.execute()
 
            let _ = enterCommand.execute()
                
            
            
            let _ = testObject.execute()
            let _ = numFormat0Command.execute()
        
            XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
            XCTAssertEqual(mockDelegate.delegate_param1 , "100      09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
 
            resetDelegateMonitor()
            
            let _ = testObject.execute()
            let _ = numFormat4Command.execute()
        
            XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
            XCTAssertEqual(mockDelegate.delegate_param1 , "123#46   09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
           
 
    }
    
}
