//
//  RecallCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 03.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class RecallCommandTests: XCTestCase {
 
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

    func testRecall(){
        let testObject = RecallCommand(calculatorEngine: engine, display: display, registerController: registerController)
          
          let result = testObject.execute()
          
          
          XCTAssertTrue(registerController.registerAccess == .Recall)
          XCTAssertTrue(result == .StoreRecall)
    }
}
