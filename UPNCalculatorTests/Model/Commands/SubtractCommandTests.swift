//
//  SubtractCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 12.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class SubtractCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SubtractCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = SubtractCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSubtractEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }

    func testSubtractOnly1OnStack() {
        engine.enterNumber(1)

           let _ = testObject.execute()
           
           guard let result = engine.top else {
               XCTFail()
               return
           }
           
           XCTAssertTrue(result == -1)
       }
    

    func testSubtract1Minus2EquaMinusOne() {
        engine.enterNumber(1)
        engine.enterNumber(2)

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == -1)
    }

   

}
