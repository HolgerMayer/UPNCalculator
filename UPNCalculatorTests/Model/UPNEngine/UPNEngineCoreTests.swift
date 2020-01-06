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
        XCTAssertNil(testObject.top)
    }
    
    func testEnterNumber(){
          testObject.enterNumber(1.0)
          XCTAssertTrue(testObject.top! == 1.0)
    }

    func testRemoveTop(){
          testObject.enterNumber(1.0)
          testObject.removeTop()
          XCTAssertNil(testObject.top)
    }
      
    func testClear() {
          testObject.enterNumber(1.0)
          testObject.clear()
          XCTAssertNil(testObject.top)
    }
      

}
