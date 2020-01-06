//
//  DivideOneByXCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class DivideOneByXCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : DivideOneByXCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = DivideOneByXCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testDivideOneByXCommandOfEmptyStack() {

        let _ = testObject.execute()
        
        if engine.top == nil {
            return
        }
        
        XCTFail()
    }


    func testDivideOneByXCommandOfZero() {
        
         engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        if engine.top == nil {
              return
          }
          
          XCTFail()
     }
    
    func testDivideOneByXCommandOfFour() {
     
        engine.enterNumber(4)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(result == 0.25)
        
    }
    
  
    func testDivideOneByXCommandOf10(){
        
        engine.enterNumber(10)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(result == 0.1)
    }
   

}
