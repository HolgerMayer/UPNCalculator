//
//  UPNEngineMultiplyTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineMultiplyTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

     
    func testMultiply(){
        testObject.enterNumber(3.0)
        testObject.enterNumber(2.0)
        testObject.multiply()
        XCTAssertTrue(testObject.top! == 6.0)
    }
       
    func testMultiply1StackItem(){
        testObject.enterNumber(2.0)
        testObject.multiply()
        XCTAssertTrue(testObject.top! == 0.0)
    }
    
    func testMultiply0StackItem(){
        testObject.multiply()
        XCTAssertTrue(testObject.top! == 0.0)
    }

}
