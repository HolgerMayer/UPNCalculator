//
//  EEXCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class EEXCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : EEXCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = EEXCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEEXCommandPushed() {
        
        display.value = 1.2
        
        let result = testObject.execute()
        
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertTrue(mockDelegate.delegate_param1 == "1.2     00", "delegate param should be 1.2.....00 is \(mockDelegate.delegate_param1)")
   
    }
}
