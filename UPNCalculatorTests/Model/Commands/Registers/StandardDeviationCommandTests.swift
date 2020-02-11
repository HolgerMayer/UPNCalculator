//
//  StandardDeviationCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class StandardDeviationCommandTests: XCTestCase {
    
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
        testObject = StandardDeviationCommand( calculatorEngine: engine, display : display, registerController : registerController)
        
    }
    
    func testStandardDeviationForFarmer(){
        let testSetup = StatisticsTestsSetup()
        
        testSetup.setupFarmerStatistic(engine: engine, display: display, registerController: registerController)
        
        let result = testObject.execute()
        
        XCTAssertEqual(result,.Default)
        XCTAssertEqual(engine.peek(register: .X)!,31.62, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,1.24, accuracy:0.01)
        
    }
    
  
}
