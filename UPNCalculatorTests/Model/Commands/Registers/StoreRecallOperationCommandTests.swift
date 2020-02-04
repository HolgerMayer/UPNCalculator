//
//  StoreRecallOperationCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 03.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class StoreRecallOperationCommandTests: XCTestCase {
 
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

    func testSetAddOperation(){
        let testObject = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "+")
   
        let result = testObject.execute()
          
          
        XCTAssertTrue(registerController.registerAccessOperation == .Add)
        XCTAssertTrue(result == .Register1)

    }
    
    func testSetMultiplyOperation(){
       let testObject = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "*")
        
        let result = testObject.execute()
               
               
        XCTAssertTrue(registerController.registerAccessOperation == .Multiply)
        XCTAssertTrue(result == .Register1)
    }
    
    func testSetSubtractOperation(){
        let testObject = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "-")
         
         let result = testObject.execute()
                
                
         XCTAssertTrue(registerController.registerAccessOperation == .Subtract)
         XCTAssertTrue(result == .Register1)
    }
    
    func testSetDeleteOperation(){
        let testObject = StoreRecallOperationCommand(calculatorEngine: engine, display: display, registerController: registerController, operationString: "/")
         
         let result = testObject.execute()
                
                
         XCTAssertTrue(registerController.registerAccessOperation == .Divide)
         XCTAssertTrue(result == .Register1)
    }
}
