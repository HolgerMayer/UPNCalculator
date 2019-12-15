//
//  EnterCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 13.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class EnterCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : EnterCommand!

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
        testObject = EnterCommand(calculatorEngine: engine, display: display)

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnterNumberToStack() {
         
        display.setDisplay(baseValue: "123.12", exponent: "")
        XCTAssertFalse(display.isPushed)
        XCTAssertNil(engine.top)
        
        testObject.execute()
        
        XCTAssertTrue(display.isPushed)
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 123.12)
        
    }

  

}

extension EnterCommandTests : DisplayDelegate
{

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
