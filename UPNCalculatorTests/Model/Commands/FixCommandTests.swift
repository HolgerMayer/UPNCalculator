//
//  FixCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 21.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class FixCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : FixCommand!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate.resetDelegate()
        display.delegate = mockDelegate
        
        testObject = FixCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testFixChangeDecimalDigits() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
         let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)

        let numFormat1Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "1")
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
        let _ = numFormat1Command.execute()
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "123#1      ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
 
        mockDelegate.resetDelegate()
        let _ = testObject.execute()
        
        let _ = numFormat7Command.execute()
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "123#1230000".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

    }
    
    func testFixChangeFormat() {
          
          let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
          let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
          let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
          let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
          let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
          let sciCommand = SciCommand(calculatorEngine: engine, display: display)

         let numFormat1Command = NumberFormatDigitCommand(calculatorEngine: engine, display: display, token: "1")
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
 
        mockDelegate.delegate_didCall_didChangeDisplay = false

        
          
          let _ = sciCommand.execute()
          
          let _ = numFormat1Command.execute()

        mockDelegate.delegate_didCall_didChangeDisplay = false
          
          
          let _ = testObject.execute()
          
          let _ = numFormat7Command.execute()
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "123#1230000".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
      }
    
}

