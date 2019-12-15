//
//  SinusCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class SineCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SineCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = SineCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSineOfEmptyStack() {

        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }


    func testSineOfZero() {
        
         engine.enterNumber(0.0)
        
         testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(result == 0)
     }
    
    func testSineOfHalfPi() {
     
        engine.enterNumber(Double.pi / 2)
    
        testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(abs(1.0 - result) < 0.0001)
        
    }
    
  
    func testSineOfPi(){
        
        engine.enterNumber(Double.pi)
        
        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

    func testSineOfHalfPiTimes3(){
        
          engine.enterNumber(Double.pi / 2 * 3)
          
          testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(result + 1.0) < 0.0001)
      }
    
}
