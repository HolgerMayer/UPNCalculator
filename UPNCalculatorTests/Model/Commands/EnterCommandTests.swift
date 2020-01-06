//
//  EnterCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 13.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class EnterCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : EnterCommand!


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = EnterCommand(calculatorEngine: engine, display: display)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnterNumberToStack() {
         
        display.value = 123.12
        XCTAssertFalse(display.isPushed)
        XCTAssertNil(engine.top)
        
        let _ = testObject.execute()
        
        XCTAssertTrue(display.isPushed)
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.12)
        
    }

  

}

