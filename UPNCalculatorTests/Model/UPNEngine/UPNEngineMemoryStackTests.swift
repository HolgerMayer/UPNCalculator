//
//  UPNEngineMemoryStackTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 23.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineMemoryStackTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!

     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
      }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

       
    func testStackLift() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)
        
        let piCommand = PiCommand(calculatorEngine: engine, display: display)
        
        let _ = piCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),Double.pi)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),2)
    }
       
    func testNoStackLiftOrDrop() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)

        let squareRootCommand = SquareRootCommand(calculatorEngine: engine, display: display)
        
        let _ = squareRootCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
    }

    func testStackDrop() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)

        let addCommand = AddCommand(calculatorEngine: engine, display: display)
            
        let _ = addCommand.execute()
            
        XCTAssertEqual(engine.peek(register:.X),7)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),1)
    }
    
    func testStackEnterBehaviour() {
       
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")

        engine.enterNumber(6)
        engine.enterNumber(7)
        engine.enterNumber(8)
        engine.enterNumber(9)

        display.isPushed = true
        display.needsOverride = false

        let _ = digit1Command.execute()
  
        XCTAssertEqual(engine.peek(register:.X),1)
        XCTAssertEqual(engine.peek(register:.Y),9)
        XCTAssertEqual(engine.peek(register:.Z),8)
        XCTAssertEqual(engine.peek(register:.T),7)

        
        let _ = enterCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),1)
        XCTAssertEqual(engine.peek(register:.Y),1)
        XCTAssertEqual(engine.peek(register:.Z),9)
        XCTAssertEqual(engine.peek(register:.T),8)

        let _ = digit2Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),1)
        XCTAssertEqual(engine.peek(register:.Z),9)
        XCTAssertEqual(engine.peek(register:.T),8)

        let _ = enterCommand.execute()
         
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),9)

        let _ = digit3Command.execute()

         
        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),9)
 
        let _ = enterCommand.execute()

        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
        
        let _ = digit4Command.execute()

        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
     }

}

