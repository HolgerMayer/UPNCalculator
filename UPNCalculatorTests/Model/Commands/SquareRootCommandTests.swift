//
//  SquareRootCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class SquareRootCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SquareRootCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = SquareRootCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSquareRootOfEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }


    func testSquareRootOfZero() {
        
         engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(result == 0)
     }
    
    func testSquareRootOfFour() {
     
        engine.enterNumber(4)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(result == 2.0)
        
    }
    
  
    func testSquareRootOfNine(){
        
        engine.enterNumber(9)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(result == 3.0)
    }
   

}
