//
//  DivideCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 12.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class DivideCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : DivideCommand!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()
    
    
 
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = DivideCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testDivideEmptyStack() {

        let _ = testObject.execute()
        
        let result = engine.top
           
        XCTAssertEqual(result,0.0)
    }

    func testMultiplyOnly3OnStack() {
        engine.enterNumber(3)

           let _ = testObject.execute()
           
           guard let result = engine.top else {
               XCTFail()
               return
           }
           
           XCTAssertTrue(result == 0)
       }
    

    func testDivide6By2Equals6() {
        engine.enterNumber(6)
        engine.enterNumber(2)

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 3)
    }

   
    func testDivideBy0() {
         engine.enterNumber(7)
         engine.enterNumber(6)
         engine.enterNumber(0)

         let _ = testObject.execute()
         
         let result = engine.top
         XCTAssertEqual(result,7)
         XCTAssertTrue(mockDelegate.delegate_param1 == "Error : division by zero")
     }

}

