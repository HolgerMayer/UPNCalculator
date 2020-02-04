//
//  ClearCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ClearCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var registerController : RegisterController!
    var testObject : ClearCommand!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        registerController = RegisterController()
        registerController.delegate = engine
        display = CalculatorDisplay()
        testObject = ClearCommand(calculatorEngine: engine, display: display, registerController: registerController)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClear(){
         for i in 0..<registerController.register.count {
             registerController.register[i] = Double(i+1)
         }
 
        engine.enterNumber(10)
        engine.enterNumber(20)
        display.value = 20.0
        display.isPushed = true
        
        let _ = testObject.execute()
        
        
        XCTAssertEqual(registerController.register[0] ,1.0)
        XCTAssertEqual(registerController.register[1] ,2.0)

        for i in 3..<8 {
             XCTAssertEqual(registerController.register[i] ,0.0)
        }
         
        for i in 8..<registerController.register.count{
             XCTAssertEqual(registerController.register[i] ,Double(i+1))
        }

        XCTAssertEqual(engine.peek(register: .X),0.0)
        XCTAssertEqual(engine.peek(register: .Y),0.0)
        XCTAssertEqual(engine.peek(register: .Z),0.0)
        XCTAssertEqual(engine.peek(register: .T),0.0)
        XCTAssertNil(display.value)
        XCTAssertFalse(display.isPushed)
    }

}
