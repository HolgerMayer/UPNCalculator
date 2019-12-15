//
//  ChangeSignCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ChangeSignCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : ChangeSignCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ChangeSignCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testChangeSign(){
         display.setDisplay(baseValue: "20", exponent: "")
        
        testObject.execute()
        
        XCTAssertNil(engine.top)
        XCTAssertTrue(display.value() == -20)
        XCTAssertFalse(display.isPushed)
 
        testObject.execute()
         
        XCTAssertNil(engine.top)
        XCTAssertTrue(display.value() == 20)
        XCTAssertFalse(display.isPushed)
    }

}
