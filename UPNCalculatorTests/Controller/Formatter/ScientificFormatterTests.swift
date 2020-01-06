//
//  ScientificFormatterTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ScientificFormatterTests: XCTestCase {

    var testObject : ScientificFormatter!
        
          
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
            
        testObject = ScientificFormatter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatToStringSmallValuePrecisionZero() {
            
        let testInput = 123.4567890123
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "1        02","result should be 1        02 is \(result!)")
    }
    
    func testFormatToStringSmallValuePrecisionFour() {
   
        let testInput = 123.4567890123
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
 
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "1.2346   02","result should be 1.2346   02 is \(result!)")
    }
        
        
    func testFormatToStringLargeValuePrecisionZero() {
              
        let testInput = 123456789012.0
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
  
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "1        11","result should be 1        11 is \(result!)")
     }
    
    func testFormatToStringLargeValuePrecisionFour() {

        let testInput = 123456789012.0
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
 
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "1.2346   11","result should be 1.2346   11 is \(result!)")
      }
        
    
    func testConvertToDouble() {
    
        let base = "1.23"
        let exponent = "2"
            
        let result = testObject.convertToDouble(baseDigits: base, exponent: exponent)
            
        XCTAssertTrue(result == 123.0, "result should be 123.0 is \(result)")
            
    }

 
    }
