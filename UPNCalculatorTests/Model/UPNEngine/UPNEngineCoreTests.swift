//
//  UPNEngineCoreTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineCoreTests: XCTestCase {

    var testObject : UPNEngine!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        testObject = UPNEngine()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialized() {
        XCTAssertEqual(testObject.peek(register: .X),0.0)
        XCTAssertEqual(testObject.peek(register: .Y),0.0)
        XCTAssertEqual(testObject.peek(register: .Z),0.0)
        XCTAssertEqual(testObject.peek(register: .T),0.0)
    }
    
    func testEnterNumber(){
          testObject.enterNumber(1.0)
          XCTAssertTrue(testObject.top! == 1.0)
    }

    func testRemoveTop(){
        testObject.enterNumber(7.0)
        testObject.enterNumber(1.0)
        testObject.removeTop()
        XCTAssertEqual(testObject.top,7.0)
    }
      
    func testClear() {
          testObject.enterNumber(4.0)
          testObject.enterNumber(3.0)
          testObject.enterNumber(7.0)
          testObject.enterNumber(1.0)
          testObject.clear()
          XCTAssertEqual(testObject.peek(register: .X),0.0)
          XCTAssertEqual(testObject.peek(register: .Y),0.0)
          XCTAssertEqual(testObject.peek(register: .Z),0.0)
          XCTAssertEqual(testObject.peek(register: .T),0.0)

    }
      

}
