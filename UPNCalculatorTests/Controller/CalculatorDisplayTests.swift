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
    
    var delegate_didCall_didChangeDisplay  : Bool = false
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
        delegate_didCall_didChangeDisplay  = false
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
         XCTAssertTrue(delegate_didCall_didChangeDisplay)
         XCTAssertTrue(delegate_param1 == "")
         XCTAssertTrue(testObject.state == .Default)
        XCTAssertFalse(testObject.isPushed)
    }
    
    func testSetDisplay(){
        
        testObject.value = 1.23
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "1.2300     ", "delegate_param1 should be 1.2300 is \(delegate_param1)")
    }
    
    func testAddBaseDigit(){
        
        
        testObject.clear()
        testObject.addBaseDigit(digit: "1")
        testObject.addBaseDigit(digit: "2")
        testObject.addBaseDigit(digit: "0")
        
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "120", "delegate_param1 should be 120 is \(delegate_param1)")
        guard let result = testObject.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(result == 120.0, "result should be 120 is \(result)")
    }

    func testRemoveBaseDigit(){
       
        testObject.clear()
         testObject.addBaseDigit(digit: "1")
         testObject.addBaseDigit(digit: "2")
         testObject.addBaseDigit(digit: "0")

        testObject.removeBaseDigit()

        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "12" ,"delegate_param1 should be 12 is \(delegate_param1)")
        guard let result = testObject.value else {
            XCTFail()
            return
        }
        XCTAssertTrue(result == 12.0, "result should be 120 is \(result)")
}
    

    
    func testChangeSign(){
        testObject.clear()
        testObject.addBaseDigit(digit: "1")
        testObject.addBaseDigit(digit: "2")
        
        testObject.changeSign()
        
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        let expectedValue = -12.0
         guard let result = testObject.value else {
             XCTFail()
             return
         }
        
         XCTAssertTrue(result == expectedValue,"result  be -12 is \(result)")
   }

    func testErrorMessage(){
        testObject.setError("Error : Division by zero")
        XCTAssertTrue(delegate_didCall_didChangeDisplay)
        XCTAssertTrue(delegate_param1 == "Error : Division by zero")

    }
    
    func testValue() {
        testObject.value = 123
        
        guard let result = testObject.value else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.0)
    }
    
    func testUpdateLastValue(){
        testObject.value = 123
        
        testObject.updateLastValue()
        
        testObject.value = 456
        
        testObject.restoreLastValue()
          
         XCTAssertTrue(testObject.value == 123.0)
    }
    
    
    // TODO: Test mode switch 
    func testStandardInputMode(){
        testObject.value = 123
         
        XCTAssertTrue(delegate_param1 == "123.0000   ")
    }
    
    
    
    func testFixInputMode(){
        testObject.value = 123
        testObject.inputMode = .fix
                
        testObject.addBaseDigit(digit: "7")
                
        XCTAssertTrue(delegate_param1 == "123.0000000")
  
        testObject.inputMode = .fix
                
        testObject.addBaseDigit(digit: "2")
        XCTAssertTrue(delegate_param1 == "123.00     ")

     }
    
    func testScientificInputMode(){
           testObject.value = 125
           testObject.inputMode = .scientific
                   
           testObject.addBaseDigit(digit: "7")
                   
           XCTAssertTrue(delegate_param1 == "1.250000 02","delegate_param1 should be 1.250000 02 is \(delegate_param1)")
     
           testObject.inputMode = .scientific
                   
           testObject.addBaseDigit(digit: "2")
            XCTAssertTrue(delegate_param1 == "1.25     02","delegate_param1 should be 1.25      02 is \(delegate_param1)")
        }
    
}


extension CalculatorDisplayTests : DisplayDelegate {
     
    func didChangeDisplay(value: String) {
        delegate_didCall_didChangeDisplay = true
        delegate_param1 = value
    }
    
    
    func didChangeState(_ state: KeyboardState) {
      delegate_didCall_didChangeState = true
    }
    
    
}
