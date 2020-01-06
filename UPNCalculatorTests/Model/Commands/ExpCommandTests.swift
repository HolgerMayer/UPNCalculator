//
//  ExpCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation



import XCTest
@testable import UPNCalculator

class ExpCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : ExpCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ExpCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testExpOfEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(1 - result) < 0.0001)
    }

    func testExp1onStack() {
        engine.enterNumber(1.0)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(2.7183 - result) < 0.0001)
    }

    
   

    
}
