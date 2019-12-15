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
   
    
    func testSin(){
        testObject.enterNumber(0.0)
        testObject.sin()
        XCTAssertTrue(testObject.top! == 0.0)

        testObject.enterNumber(Double.pi / 2)
        testObject.sin()
        XCTAssertTrue(testObject.top! == 1.0)
        
        
        testObject.enterNumber(Double.pi)
        testObject.sin()

        XCTAssertTrue(abs(testObject.top!) < 0.0001)
        
        testObject.enterNumber(Double.pi / 2 * 3)
        testObject.sin()
        XCTAssertTrue(testObject.top! == -1.0)
    }
    
    
    func testCos(){
        testObject.enterNumber(0.0)
        testObject.cos()
        XCTAssertTrue(testObject.top! == 1.0)

        testObject.enterNumber(Double.pi / 2)
        testObject.cos()
        XCTAssertTrue(abs(testObject.top!) < 0.0001)
        
        
        testObject.enterNumber(Double.pi)
        testObject.cos()
        XCTAssertTrue(testObject.top! == -1.0)
        
        testObject.enterNumber(Double.pi / 2 * 3)
        testObject.cos()
        XCTAssertTrue(abs(testObject.top!) < 0.0001)

    }
    
    func testTan(){
         testObject.enterNumber(0.0)
         testObject.tan()
         XCTAssertTrue(testObject.top! == 0.0)

         testObject.enterNumber(Double.pi)
         testObject.tan()
         XCTAssertTrue(abs(testObject.top!) < 0.0001)
         
         testObject.enterNumber(-Double.pi)
         testObject.tan()
         XCTAssertTrue(abs(testObject.top!) < 0.0001)
         
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
    
    func testAsin0() {
    
          testObject.enterNumber(0.0)
          
          testObject.asin()
          
          XCTAssertNotNil(testObject.top)
          XCTAssertTrue(abs(testObject.top!) < 0.0001)

          
      }
    
    func testAsin1() {
  
        testObject.enterNumber(1.0)
        
        testObject.asin()
        
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(abs(1.5708 - testObject.top!) < 0.0001)

        
    }
    
    func testAcos0() {
      
            testObject.enterNumber(0.0)
            
            testObject.acos()
            
            XCTAssertNotNil(testObject.top)
            XCTAssertTrue(abs(1.5708 - testObject.top!) < 0.0001)

            
        }
      
      func testAcos1() {
    
          testObject.enterNumber(1.0)
          
          testObject.acos()
          
          XCTAssertNotNil(testObject.top)
          XCTAssertTrue(abs(testObject.top!) < 0.0001)
      }
    
    func testAtan0() {
        
        testObject.enterNumber(0.0)
              
        testObject.atan()
              
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(abs(testObject.top!) < 0.0001)

              
    }
        
    func testAtan1() {
      
        testObject.enterNumber(1.0)
            
        testObject.atan()
            
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(abs(testObject.top!-0.7854) < 0.0001)
    }
    
    func testExp() {
        testObject.enterNumber(1.0)
             
        testObject.exp()
             
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(abs(testObject.top!-2.7183) < 0.0001)
    }
    
    func testLog() {
        testObject.enterNumber(2.7183)
        
        do {
            try testObject.log()
                
            XCTAssertNotNil(testObject.top)
            XCTAssertTrue(abs(testObject.top!-1) < 0.0001)
        } catch {
            XCTFail("Log from 2.7183 did  throw exception")
        }
    }
    
    func testlog10(){
        testObject.enterNumber(100)
                
    
        do {
            try testObject.log10()
            XCTAssertNotNil(testObject.top)
            XCTAssertTrue(abs(testObject.top!-2) < 0.0001)
        } catch {
            XCTFail("Log10 from 100 did  throw exception")
        }
        
    }
    
    
}
