//
//  RecallSumCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class RecallSumCommandTests: XCTestCase {

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
        testObject = RecallSumCommand( calculatorEngine: engine, display : display, registerController : registerController)

    }

    
    
    func testSingleEntry(){
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let sumSubtractCommand = SumSubtractCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let _ = digit5Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
          
        let _ = sumSubtractCommand.execute()
        
        let result = testObject.execute()
          
        XCTAssertEqual(result,.Default)
          
        XCTAssertEqual(engine.peek(register: .X),-3)
        XCTAssertEqual(engine.peek(register: .Y),-5)

        XCTAssertEqual(registerController.register[2],-1)
        XCTAssertEqual(registerController.register[3],-3)
        XCTAssertEqual(registerController.register[4],-9)
        XCTAssertEqual(registerController.register[5],-5)
        XCTAssertEqual(registerController.register[6],-25)
        XCTAssertEqual(registerController.register[7],-15)

      }
      
}
