//
//  CalculatorDisplayTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class CalculatorDisplayTests: XCTestCase {

    var testObject : CalculatorDisplay!
    
    var delegate_didCall_didChangeBase  : Bool = false
    var delegate_didCall_didChangeExponent : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 : String = ""
    var delegate_resultValue : String = ""
    
    override func setUp() {

        testObject = CalculatorDisplay()
        testObject.delegate = self
        resetDelegateTracker()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func resetDelegateTracker() {
        delegate_didCall_didChangeBase  = false
        delegate_didCall_didChangeExponent  = false
        delegate_didCall_didChangeState = false
        delegate_param1  = ""
        delegate_resultValue  = ""
    }

    func testIsPushed() {
        XCTAssertFalse(testObject.isPushed)
        testObject.isPushed = true
        XCTAssertTrue(testObject.isPushed)
        testObject.isPushed = false
        XCTAssertFalse(testObject.isPushed)
    }

   
    func testState(){
        XCTAssertTrue(testObject.state == .Default)
        
        testObject.state = .FState
        XCTAssertTrue(testObject.state == .FState)
        
        testObject.state = .GState
        XCTAssertTrue(testObject.state == .GState)
        
        testObject.state = .Default
        XCTAssertTrue(testObject.state == .Default)
    }
    
    func testClear() {
         testObject.clear()
         XCTAssertTrue(delegate_didCall_didChangeBase)
         XCTAssertTrue(delegate_param1 == "")
         XCTAssertTrue(testObject.state == .Default)
        XCTAssertFalse(testObject.isPushed)
    }
    
    func testSetDisplay(){
        testObject.setDisplay(baseValue: "1.23", exponent: "00")
        XCTAssertTrue(delegate_didCall_didChangeBase)
        XCTAssertTrue(delegate_param1 == "1.23")
    }
    
    func testAddBaseDigit(){
        
        
        testObject.setDisplay(baseValue: "12", exponent: "")
        testObject.addBaseDigit(digit: "0")
        
        XCTAssertTrue(delegate_didCall_didChangeBase)
        XCTAssertTrue(delegate_param1 == "120")
        guard let result = testObject.value() else {
            XCTFail()
            return
        }
        XCTAssertTrue(result == 120.0)
    }

    func testRemoveBaseDigit(){
       
        testObject.setDisplay(baseValue: "120", exponent: "")
        
        testObject.removeBaseDigit()

        XCTAssertTrue(delegate_didCall_didChangeBase)
        XCTAssertTrue(delegate_param1 == "12")
        guard let result = testObject.value() else {
            XCTFail()
            return
        }
        XCTAssertTrue(result == 12.0)
}
    

    
    func testChangeSign(){
        testObject.setDisplay(baseValue: "12", exponent: "")
        
        testObject.changeSign()
        
        XCTAssertTrue(delegate_didCall_didChangeBase)
        let expectedValue = -12.0
         guard let result = testObject.value() else {
             XCTFail()
             return
         }
        
         XCTAssertTrue(result == expectedValue)
   }

    func testErrorMessage(){
        testObject.setError("Error : Division by zero")
        XCTAssertTrue(delegate_didCall_didChangeBase)
        XCTAssertTrue(delegate_param1 == "Error : Division by zero")

    }
    
    func testValue() {
        testObject.setDisplay(baseValue: "123", exponent: "")
        
        guard let result = testObject.value() else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.0)
    }
    
    func testLastValue() {
        testObject.setDisplay(baseValue: "123", exponent: "")
        
        let result1 = testObject.lastValue()
        
        XCTAssertNil(result1)
        
        testObject.isPushed = true

        let result2 = testObject.lastValue()

        XCTAssertNotNil(result2)
        XCTAssertTrue(result2 == 123)
    }
    
}


extension CalculatorDisplayTests : DisplayDelegate {
     
    func didChangeBase(value: String) {
        delegate_didCall_didChangeBase = true
        delegate_param1 = value
    }
    
    func didChangeExponent(value: String) {
        delegate_didCall_didChangeExponent = true
        delegate_param1 = value
    }
    
    func didChangeState(_ state: KeyboardState) {
      delegate_didCall_didChangeState = true
    }
    
    
}
