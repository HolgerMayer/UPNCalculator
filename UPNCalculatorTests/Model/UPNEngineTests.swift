//
//  UPNEngineTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineTests: XCTestCase {

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

    func testClear() {
        testObject.enterNumber(1.0)
        testObject.clear()
        XCTAssertNil(testObject.top)
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
