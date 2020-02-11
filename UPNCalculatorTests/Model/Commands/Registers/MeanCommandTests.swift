//
//  MeanCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class MeanCommandTests: XCTestCase {
    
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
        testObject = MeanCommand( calculatorEngine: engine, display : display, registerController : registerController)
        
    }
    
    func testMean(){
        let testSetup = StatisticsTestsSetup()
         
        testSetup.setupFarmerStatistic(engine: engine, display: display, registerController: registerController)
        
        let result = testObject.execute()
       
        XCTAssertEqual(result,.Default)
        XCTAssertEqual(engine.peek(register: .X)!,40.0, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,6.40, accuracy:0.01)
        
    }
    
    func testMeanSimple(){
        let testSetup = StatisticsTestsSetup()
        
        testSetup.setupSimpleStatistic(engine: engine, display: display, registerController: registerController)
        
        let result = testObject.execute()
        
        XCTAssertEqual(result,.Default)
        XCTAssertEqual(engine.peek(register: .X)!,5, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,4, accuracy:0.01)
        
    }
}
