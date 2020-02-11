//
//  NumberFormatDigitCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class NumberFormatDigitCommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : NumberFormatDigitCommand!
    
    override func setUp() {
        // Put setup  here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        
        testObject = NumberFormatDigitCommand(calculatorEngine: engine, display: display,token:"2")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberFormatDigitCommandPushed() {
        
        display.inputMode = .fix
        display.value =  1.0
        
        let result = testObject.execute()
        
        XCTAssertTrue(result == .Default)
        XCTAssertTrue(display.inputMode == .standard)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        

        XCTAssertEqual(mockDelegate.delegate_param1 , "1#00       ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
    }
}
