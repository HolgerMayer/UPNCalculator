//
//  UPNEngineTrigonometricTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineTrigonometricTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
}
