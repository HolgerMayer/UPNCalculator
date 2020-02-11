//
//  PermutationsCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class PermutationsCommandTests:  CommandTestCase {
    
    override func createTestObject() -> Command? {
        return PermutationsCommand(calculatorEngine: engine, display: display)
    }
    
    
    
    func testPermutations() {
        
        engine.enterNumber(5.0)
        engine.enterNumber(3.0)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertEqual(result,60.0)
    }
    
}
