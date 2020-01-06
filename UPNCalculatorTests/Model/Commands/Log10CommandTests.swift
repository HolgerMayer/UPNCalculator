//
//  Log10CommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class Log10CommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : Log10Command!
    var mockDelegate : DisplayMockDelegate = DisplayMockDelegate()

    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = Log10Command(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    // Should result in Error!!!
    func testLog10OfEmptyStack() {

        let _ = testObject.execute()
        
        let result = engine.top

        XCTAssertNil(result)
        XCTAssertTrue(mockDelegate.delegate_param1 == "Error : log10 from zero")
        
        
    }

    func testLog100onStack() {
        engine.enterNumber(100)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(2 - result) < 0.0001)
    }

}

