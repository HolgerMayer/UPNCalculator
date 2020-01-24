//
//  ChangeSignCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ChangeSignCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : ChangeSignCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ChangeSignCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangeSign(){
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        
        let _ = digit2Command.execute()
        let _ = digit0Command.execute()
        
        let _ = testObject.execute()
        
        XCTAssertEqual(display.value,-20)
        XCTAssertEqual(engine.top!,-20)
        XCTAssertTrue(display.isPushed)
 
        let _ = testObject.execute()
         
        XCTAssertEqual(display.value,20)
        XCTAssertEqual(engine.top!,20)
        XCTAssertTrue(display.isPushed)
    }

    func testChangeSignOfNumberLessThanOne(){
         let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
         let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")

          let _ = digit0Command.execute()
          let _ = dotCommand.execute()
          let _ = digit1Command.execute()
               
        let _ = testObject.execute()
               
 
        XCTAssertEqual(display.value, -0.1)
        XCTAssertEqual(engine.top!,-0.1)
        XCTAssertTrue(display.isPushed)
        
        let _ = testObject.execute()
                
        XCTAssertEqual(display.value, 0.1)
        XCTAssertEqual(engine.top!,0.1)
        XCTAssertTrue(display.isPushed)

    }
    
}
