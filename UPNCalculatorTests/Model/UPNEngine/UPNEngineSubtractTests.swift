//
//  UPNEngineSubtractTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class UPNEngineSubtractTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }


    func testSubtract(){
        testObject.enterNumber(1.0)
        testObject.enterNumber(2.0)
        testObject.subtract()
        XCTAssertTrue(testObject.top! == -1.0)
    }

    func testSubtract1StackItem(){
        testObject.enterNumber(2.0)
        testObject.subtract()
        XCTAssertTrue(testObject.top! == -2.0)
    }

    func testSubtract0StackItem(){
        testObject.subtract()
        XCTAssertTrue(testObject.top! == 0.0)
    }
}
