//
//  PICommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 16.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class PiCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : PiCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = PiCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    func testPi() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        XCTAssertTrue(abs(result - Double.pi) < 0.0001)
        
        guard let value = display.value else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(value - Double.pi) < 0.0001)

 
    }

  

}
