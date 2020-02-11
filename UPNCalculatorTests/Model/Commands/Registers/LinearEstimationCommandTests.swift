//
//  LinearEstimationCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class LinearEstimationCommandTests: XCTestCase {
    
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
        testObject = LinearEstimationCommand( calculatorEngine: engine, display : display, registerController : registerController)
        
    }
    
    func testLinearRegressionForFarmer(){
        let testSetup = StatisticsTestsSetup()
        
        testSetup.setupFarmerStatistic(engine: engine, display: display, registerController: registerController)
        
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        
        let _ = digit7Command.execute()
        let _ = digit0Command.execute()
        
        
        let result = testObject.execute()
        
        XCTAssertEqual(result,.Default)
        XCTAssertEqual(engine.peek(register: .X)!,7.56, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,0.99, accuracy:0.01)
        
    }
    
    
}
