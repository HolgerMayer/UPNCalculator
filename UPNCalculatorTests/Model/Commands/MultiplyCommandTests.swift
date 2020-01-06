//
//  MultiplyCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 12.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class MultiplyCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : MultiplyCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = MultiplyCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testMultiplyEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }

    func testMultiplyOnly3OnStack() {
        engine.enterNumber(3)

           let _ = testObject.execute()
           
           guard let result = engine.top else {
               XCTFail()
               return
           }
           
           XCTAssertTrue(result == 0)
       }
    

    func testMultiply2By3Equals6() {
        engine.enterNumber(2)
        engine.enterNumber(3)

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 6)
    }

   

}
