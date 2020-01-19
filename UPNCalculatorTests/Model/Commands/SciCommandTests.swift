//
//  SciCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class SciCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SciCommand!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        mockDelegate.resetDelegate()
        testObject = SciCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
  
    func testChangeDecimalDigits() {
        
            let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
            let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
            let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
            let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
            let enterCommand = EnterCommand(calculatorEngine: engine, display: display)

            let numFormat4Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "4")
            let numFormat7Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "7")

        
            let _ = digit1Command.execute()
            let _ = digit2Command.execute()
            let _ = digit3Command.execute()
            let _ = dotCommand.execute()
            let _ = digit1Command.execute()
            let _ = digit2Command.execute()
            let _ = digit3Command.execute()

            let _ = enterCommand.execute()
                
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "123#1230   ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        mockDelegate.resetDelegate()
            
            
            let _ = testObject.execute()
            
            let _ = numFormat4Command.execute()
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#2312   02".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
 
        
        mockDelegate.resetDelegate()
            
            
            let _ = testObject.execute()
            
            let _ = numFormat7Command.execute()
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#231230 02".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
 
         

    }
    
}
