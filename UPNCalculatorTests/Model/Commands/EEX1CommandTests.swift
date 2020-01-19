//
//  EEX1CommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class EEX1CommandTests: XCTestCase {

    var locale : Locale!
    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    var testObject : EEX1Command!
    var testObject3 : EEX1Command!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        testObject = EEX1Command(calculatorEngine: engine, display: display,token:"2")
        testObject3 = EEX1Command(calculatorEngine: engine, display: display,token:"3")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEEX1CommandPushed() {
        
        display.value = 1.2
        display.initializeExponentEntry()
        mockDelegate.resetDelegate()
        
        var result = testObject.execute()
        
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     02".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
        
        mockDelegate.resetDelegate()
        
        result = testObject.execute()
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     22".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        mockDelegate.resetDelegate()
         
        result = testObject3.execute()
        XCTAssertTrue(result == .EEX1)
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeDisplay)
        XCTAssertEqual(mockDelegate.delegate_param1 , "1#2     23".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
        
    }
}
