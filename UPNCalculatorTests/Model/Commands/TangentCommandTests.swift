//
//  TangentCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class TangentCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : TangentCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = TangentCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testTangentOfEmptyStack() {

        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0.0)
    }


    func testTangentOfZero() {
        
         engine.enterNumber(0.0)
        
         testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
        XCTAssertTrue(result == 0.0)
     }
    
  
    
  
    func testTangentOfPi(){
        
        engine.enterNumber(Double.pi)
        
        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

     func testTangentOfMinusPi(){
         
         engine.enterNumber(-Double.pi)
         
         testObject.execute()
         
         guard let result = engine.top else {
             XCTFail()
             return
         }
            
         XCTAssertTrue(abs(result) < 0.0001)
     }
    
  
    
}
