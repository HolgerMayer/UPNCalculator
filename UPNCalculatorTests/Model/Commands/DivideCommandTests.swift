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
    
    
    var delegate_didCall_didChangeBase  : Bool = false
    var delegate_didCall_didChangeExponent : Bool = false
    var delegate_didCall_didChangeState : Bool = false
    var delegate_param1 : String = ""
    var delegate_resultValue : String = ""

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = self
        testObject = DivideCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testDivideEmptyStack() {

        testObject.execute()
        
        let result = engine.top
           
        XCTAssertNil(result)
    }

    func testMultiplyOnly3OnStack() {
        engine.enterNumber(3)

           testObject.execute()
           
           guard let result = engine.top else {
               XCTFail()
               return
           }
           
           XCTAssertTrue(result == 0)
       }
    

    func testDivide6By2Equals6() {
        engine.enterNumber(6)
        engine.enterNumber(2)

        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 3)
    }

   
    func testDivideBy0() {
         engine.enterNumber(6)
         engine.enterNumber(0)

         testObject.execute()
         
         let result = engine.top
         
         XCTAssertNil(result)
         XCTAssertTrue(delegate_param1 == "Error during division calculation")
     }

}



extension DivideCommandTests : DisplayDelegate {
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
