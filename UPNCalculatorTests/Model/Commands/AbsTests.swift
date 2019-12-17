//
//  AbsTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class AbsCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : AbsCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = AbsCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testZeroValue() {
        engine.enterNumber(0)
               
        testObject.execute()
               
        guard let result = engine.top else {
                XCTFail()
                return
        }
               
        XCTAssertTrue(result == 0.0)
    
    }

    

    func testPositiveValue() {

        engine.enterNumber(3)
            
        testObject.execute()
            
        guard let result = engine.top else {
                XCTFail()
                return
        }
            
        XCTAssertTrue(result == 3.0)
 
    }

     func testNegativeValue() {

        engine.enterNumber(-3.0)
               
           testObject.execute()
               
           guard let result = engine.top else {
                   XCTFail()
                   return
           }
               
           XCTAssertTrue(result == 3.0)
    
       }
  

}
