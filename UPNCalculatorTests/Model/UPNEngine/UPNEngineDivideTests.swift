//
//  UPNEngineDivideTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class UPNEngineDivideTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

     
    func testDivide(){
        testObject.enterNumber(6.0)
        testObject.enterNumber(2.0)
        do {
            try testObject.divide()
        } catch {
            XCTFail("Calculation Error")
        }

        XCTAssertTrue(testObject.top! == 3.0)
    }
        
    func testDivide1StackItem(){
        testObject.enterNumber(2.0)
            
        do {
            try testObject.divide()
        } catch {
            XCTFail("Calculation Error")
        }

        XCTAssertTrue(testObject.top! == 0.0)
    }
        
    func testDivide0StackItem(){

        do {
            try testObject.divide()
            XCTAssertTrue(testObject.top! == 0.0)
        } catch {
            return
        }
              
        XCTFail("Division by Zero did not throw exception")
    }
        
    func testDivisionByZero(){
        
        testObject.enterNumber(6.0)
        testObject.enterNumber(0.0)
            
        do {
            try testObject.divide()
            XCTAssertTrue(testObject.top! == 0.0)
        } catch {
            return
        }
    
        XCTFail("Division by Zero did not throw exception")
    }


}
