//
//  ClearRegCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 03.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ClearRegCommandTests: XCTestCase {

  
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

    func testClearReg(){
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        
        let stoCommand = StoreCommand(calculatorEngine: engine, display: display, registerController: registerController)
        let rclCommand = RecallCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let register0Command = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController, token: "0")

        
        let _ = digit2Command.execute()
  
        let _ = stoCommand.execute()
        let _ = register0Command.execute()
        
        XCTAssertEqual(display.value!,2)
        
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        
        XCTAssertEqual(display.value!,1)
        
        
        let _ = rclCommand.execute()
        let _ = register0Command.execute()

        XCTAssertEqual(display.value!,2)
        
        let clearRegCommand = ClearRegCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let _ = clearRegCommand.execute()
        
        let _ = rclCommand.execute()
        let _ = register0Command.execute()

        XCTAssertEqual(display.value!,0)

    }
    
}
