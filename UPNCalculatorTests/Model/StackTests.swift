//
//  StackTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class StackTests: XCTestCase {

    var testObject : Stack<Double>!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
       testObject = Stack<Double>()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialize() {
        XCTAssertNil(testObject.top)
    }
    
    func testPush() {
        testObject.push(1.0)
        XCTAssertTrue(testObject.top! == 1.0)
        testObject.push(2.0)
        XCTAssertTrue(testObject.top! == 2.0)
    }
    
    func testPop() {
        testObject.push(1.0)
        testObject.push(2.0)
        XCTAssertTrue(testObject.pop()! == 2.0)
        XCTAssertTrue(testObject.top! == 1.0)
        XCTAssertTrue(testObject.pop()! == 1.0)
        XCTAssertNil(testObject.top)

    }
    
    func testPopFromEpmtpyStack(){
        XCTAssertNil(testObject.pop())
    }

    func testClear(){
        testObject.push(1.0)
        testObject.push(2.0)
        testObject.clear()
        XCTAssertNil(testObject.top)

    }

}
