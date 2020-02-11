//
//  SumSubtractCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 10.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class SumSubtractCommandTests: XCTestCase {
 
    var engine : UPNEngine!
    var registerController : RegisterController!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : Command!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        registerController = RegisterController()
        registerController.delegate = engine
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = SumSubtractCommand( calculatorEngine: engine, display : display, registerController : registerController)
    }

  
    func testSingleEntry(){
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        
        let _ = digit5Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
        
        let result = testObject.execute()
        
        XCTAssertEqual(result,.Default)
        
        XCTAssertEqual(registerController.register[2],-1)
        XCTAssertEqual(registerController.register[3],-3)
        XCTAssertEqual(registerController.register[4],-9)
        XCTAssertEqual(registerController.register[5],-5)
        XCTAssertEqual(registerController.register[6],-25)
        XCTAssertEqual(registerController.register[7],-15)

    }
    
    func testMultipleEntries(){
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
              
        let _ = digit5Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
              
        var result = testObject.execute()
        
             
        let _ = digit7Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
                     
        result = testObject.execute()
             
        XCTAssertEqual(result,.Default)
              
        XCTAssertEqual(registerController.register[2],-2)
        XCTAssertEqual(registerController.register[3],-5)
        XCTAssertEqual(registerController.register[4],-13)
        XCTAssertEqual(registerController.register[5],-12)
        XCTAssertEqual(registerController.register[6],-74)
        XCTAssertEqual(registerController.register[7],-29)
    }

    
    func testAnotherMultipleAddAndSubEntries(){
    
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        let digit8Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "8")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let sumAddCommand = SumAddCommand(calculatorEngine: engine, display: display, registerController: registerController)
          
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit0Command.execute()
          
        let _ = sumAddCommand.execute()
          
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit6Command.execute()
        let _ = dotCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit7Command.execute()
        let _ = dotCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit7Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit8Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()
          
        // Now correction
        
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit0Command.execute()

        let _ = testObject.execute()

        let _ = digit5Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        
        XCTAssertEqual(registerController.register[2],5)
        XCTAssertEqual(registerController.register[3],200)
        XCTAssertEqual(registerController.register[4],12000)
        XCTAssertEqual(registerController.register[5],32.01, accuracy:0.01)
        XCTAssertEqual(registerController.register[6],211.05, accuracy:0.01)
        XCTAssertEqual(registerController.register[7],1435)
      }
}
