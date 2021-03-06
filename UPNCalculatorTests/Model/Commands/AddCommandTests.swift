//
//  AddCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class AddCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : AddCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = AddCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testAddEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }

    func testAddOnly1OnStack() {
        engine.enterNumber(1)

           let _ = testObject.execute()
           
           guard let result = engine.top else {
               XCTFail()
               return
           }
           
           XCTAssertTrue(result == 1)
       }
    

    func testAdd1To2Equals3() {
        engine.enterNumber(1)
        engine.enterNumber(2)

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 3)
    }

   
    func testCancelFixInput() {
          engine.enterNumber(1)
          engine.enterNumber(2)

          display.inputMode = .fix
          let _ = testObject.execute()
          
           
        XCTAssertTrue(display.inputMode == .standard)
      }
    
    func testCancelScientificInput() {
           engine.enterNumber(1)
           engine.enterNumber(2)

           display.inputMode = .scientific
        
           let _ = testObject.execute()
           
            
         XCTAssertTrue(display.inputMode == .standard)
       }
}
