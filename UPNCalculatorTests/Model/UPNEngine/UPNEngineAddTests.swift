//
//  UPNEngineAddTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineAddTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

   func testAdd()  {
        testObject.enterNumber(1.0)
        testObject.enterNumber(2.0)
        testObject.add()
        XCTAssertTrue(testObject.top! == 3.0)
    }
 
    func testAdd1StackItem()  {
         testObject.enterNumber(1.0)
         testObject.add()
         XCTAssertTrue(testObject.top! == 1.0)
     }

    func testAdd0StackItem()  {
           testObject.add()
          XCTAssertTrue(testObject.top! == 0.0)
    }

}
