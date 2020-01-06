//
//  LastXCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class LastXCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : LastXCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = LastXCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPushValue() {
        
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let addCommand = AddCommand(calculatorEngine: engine, display: display)
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = digit1Command.execute()
        
        let _ = enterCommand.execute()
        
        let _ = digit2Command.execute()
        let _ = digit3Command.execute()
        let _ = digit2Command.execute()
        
        let _ = addCommand.execute()
        
 
        let _ = testObject.execute()
               
        guard let result = engine.top else {
                XCTFail()
                return
        }
               
        
        XCTAssertTrue(result == 232.0, "Should be 232 is \(result)")
    
         
        
    }

    
}
