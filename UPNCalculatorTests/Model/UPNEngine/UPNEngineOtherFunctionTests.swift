//
//  UPNEngineOtherFunctionTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineOtherFunctionTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

    func testAbsPositive() {
        testObject.enterNumber(2.0)
           
        testObject.abs()
           
        XCTAssertTrue(testObject.top! == 2.0)
    }
       
    func testAbsNegative() {
            
        testObject.enterNumber(-2.0)
             
        testObject.abs()
             
        XCTAssertTrue(testObject.top! == 2.0)
    }
       
     
    func testSqrt(){
        testObject.enterNumber(0.0)
        testObject.sqrt()
        XCTAssertTrue(testObject.top! == 0.0)

        testObject.enterNumber(4.0)
        testObject.sqrt()
        XCTAssertTrue(abs(2.0 - testObject.top!) < 0.0001)
              
        testObject.enterNumber(9.0)
        testObject.sqrt()
        XCTAssertTrue(abs(3.0 - testObject.top!) < 0.0001)

    }
       
    func testPow() {
        testObject.enterNumber(2.0)
        testObject.enterNumber(5.0)
           
        testObject.pow()
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(testObject.top! == 32.0)
           

    }
       

}
