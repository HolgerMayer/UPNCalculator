//
//  StoRclTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 03.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class StoRclTests: XCTestCase {

  
    var engine : UPNEngine!
    var registerController : RegisterController!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        registerController = RegisterController()
        registerController.delegate = engine
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
    }

    func testStoRclAddSubtract(){
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit8Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "8")
        
        let stoCommand = StoreCommand(calculatorEngine: engine, display: display, registerController: registerController)
        let rclCommand = RecallCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let addOpCommand = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "+")
        let subtractOpCommand = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "-")
        let register0Command = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController, token: "0")

        
        let _ = digit8Command.execute()
  
        let _ = stoCommand.execute()
        let _ = register0Command.execute()
        
        XCTAssertEqual(display.value!,8)
        
        let _ = digit4Command.execute()

        let _ = stoCommand.execute()
        let _ = addOpCommand.execute()
        let _ = register0Command.execute()
        
        XCTAssertEqual(display.value!,4)

        let _ = digit3Command.execute()

        let _ = stoCommand.execute()
        let _ = addOpCommand.execute()
        let _ = register0Command.execute()

        XCTAssertEqual(display.value!,3)

        let _ = digit2Command.execute()
        let _ = digit4Command.execute()

        let _ = rclCommand.execute()
        let _ = subtractOpCommand.execute()
        let _ = register0Command.execute()

        XCTAssertEqual(display.value!,9)
        
        let _ = rclCommand.execute()
        let _ = register0Command.execute()

        XCTAssertEqual(display.value!,15)

    }
    
}
