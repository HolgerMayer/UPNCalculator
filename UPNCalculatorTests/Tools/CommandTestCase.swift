//
//  CommandTestCase.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 15.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class CommandTestCase: XCTestCase {

 var engine : UPNEngine!
 var display : CalculatorDisplay!
 var mockDelegate : DisplayMockDelegate!
 var testObject : Command!
 
    override func setUp() {
     // Put setup code here. This method is called before the invocation of each test method in the class.
     
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = createTestObject()
    }

    func createTestObject() -> Command? {
        return nil
    }
    
    func validateFor(testInput : [Double], expectedResult : [Double], testTypeMessage : String , roundTo : Int) {
        
         
        if (testInput.count != expectedResult.count) {
            XCTFail("TestError: Input and expected result vector not same size")
            return
        }
        
        for i in 0..<testInput.count {
              engine.clear()
              let test = testInput[i]
              engine.enterNumber(test)
              display.isPushed = true
           
              let _ =  testObject.execute()
              
              guard let result = engine.top else {
                    XCTFail()
                    return
                }
              
              let checkValue = result.roundToDecimal(roundTo)

              XCTAssertTrue(expectedResult[i] == checkValue, " \(testTypeMessage) (\(test)) should be  \(expectedResult[i])  is  \(checkValue)")
          }
    }
}
