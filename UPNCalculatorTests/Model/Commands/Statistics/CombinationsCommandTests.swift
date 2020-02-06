//
//  CombinationsCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class CombinationsCommandTests:  CommandTestCase {

   override func createTestObject() -> Command? {
       return CombinationsCommand(calculatorEngine: engine, display: display)
   }
    
    
 
    func testCombinations() {
        
        engine.enterNumber(52.0)
        engine.enterNumber(4.0)

        let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
        XCTAssertEqual(result,270725.0)
     }
    
}
