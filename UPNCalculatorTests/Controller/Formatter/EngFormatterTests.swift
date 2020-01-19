//
//  EngFormatterTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class EngFormatterTests: XCTestCase {

    var locale : Locale!
    var testObject : EngFormatter!
     
      
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
         
        locale = Locale.current
        testObject = EngFormatter()
    }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

     func testFormatToStringSmallValuePrecisionZero() {
         
        let testInput = 123.4567890123
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "100      00","result should be 100      00 is \(result!)")
    }
      
    func testFormatToStringSmallValuePrecisionFour() {

        let testInput = 123.4567890123
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
         
        XCTAssertNotNil(result)
        XCTAssertEqual(result! , "123#46   00".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
     }
     
     
     func testFormatToStringLargeValuePrecisionZero() {
           
        let testInput = 123456789012.0
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result! , "100      09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
    }
        
    func testFormatToStringLargeValuePrecisionFour() {

        let testInput = 123456789012.0
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result! , "123#46   09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
    }
     
     func testConvertToDouble() {
         let base = "1.23"
         let exponent = "2"
         
         let result = testObject.convertToDouble(baseDigits: base, exponent: exponent)
         XCTAssertTrue(result == 123.0, "result should be 123.0 is \(result)")
         
     }

  
 }

