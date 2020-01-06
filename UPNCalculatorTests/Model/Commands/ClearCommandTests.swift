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
    var testObject : ClearCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ClearCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClear(){
        engine.enterNumber(10)
        engine.enterNumber(20)
        display.value = 20.0
        display.isPushed = true
        
        let _ = testObject.execute()
        
        XCTAssertNil(engine.top)
        XCTAssertNil(display.value)
        XCTAssertFalse(display.isPushed)
    }

}
