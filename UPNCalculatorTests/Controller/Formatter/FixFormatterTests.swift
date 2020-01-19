//
//  FixFormatterTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 22.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class FixFormatterTests: XCTestCase {

    var locale : Locale!
    var testObject : FixFormatter!
    
     
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        locale = Locale.current
        testObject = FixFormatter()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFormatToStringSmallValuePrecisionZero() {
        
        let testInput = 123.4567890123
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "123        ", "result should be 123........ is \(result!)")
    }
    
    func testFormatToStringNegativNumberBetweenZeroAndMinusOne(){
         let testInput = -0.1
         testObject.precision = 4
         
         let result = testObject.convertToString(testInput)
         
         XCTAssertNotNil(result)
         XCTAssertEqual(result , "-0#1000    ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

    }
    
    func testFormatToStringSmallValuePrecisionFour() {
        
        let testInput = 123.4567890123
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
       
        XCTAssertNotNil(result)
        XCTAssertEqual(result , "123#4568   ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
    }
    
    
    func testFormatToStringLargeValuePrecisionZero() {
          
        let testInput = 123456789012.0
        testObject.precision = 0
        
        let result = testObject.convertToString(testInput)
        
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "1        11", "result should be 1........11 is \(result!)")
    }
    
    func testFormatToStringLargeValuePrecisionFour() {
             
        let testInput = 123456789012.0
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
 
        XCTAssertNotNil(result)
        XCTAssertEqual(result , "1#2346   11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
       }
    
    func testConvertToDouble() {
        let base = "1.23"
        let exponent = "2"
        
        let result = testObject.convertToDouble(baseDigits: base, exponent: exponent)
        
        XCTAssertTrue(result == 123.0, "result should be 123.0 is \(result)")
    }

    func testPrecisionVariantsPositiveExponent(){
        let testInput = 123456789012.0

         testObject.precision = 0
         XCTAssertEqual(testObject.convertToString(testInput)!, "1        11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
       
         testObject.precision = 1
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#2      11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 2
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#23     11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 3
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#235    11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
        
        testObject.precision = 4
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#2346   11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 5
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#23457  11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 6
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#234568 11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
        
        testObject.precision = 7
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#234568 11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 8
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#234568 11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 9
        XCTAssertEqual(testObject.convertToString(testInput)!, "1#234568 11".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

    }
    
    
     func testPrecisionVariantsNegativeExponentLargeValue(){
        let testInput = 0.0001

        testObject.precision = 0
        XCTAssertEqual(testObject.convertToString(testInput)!, "0          ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
             
        testObject.precision = 1
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#0        ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 2
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#00       ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
        
        testObject.precision = 3
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#000      ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
            
        testObject.precision = 4
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#0001     ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 5
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#00010    ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 6
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#000100   ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
            
        testObject.precision = 7
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#0001000  ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 8
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#00010000 ".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

        testObject.precision = 9
        XCTAssertEqual(testObject.convertToString(testInput)!, "0#000100000".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
     
    }

    func testPrecisionVariantsNegativeExponentSmallValue(){
         let testInput = 0.000000001

         testObject.precision = 0
         XCTAssertEqual(testObject.convertToString(testInput)!, "1       -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
             
         testObject.precision = 1
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#0     -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 2
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#00    -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 3
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#000   -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
             
         testObject.precision = 4
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#0000  -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 5
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#00000 -09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 6
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#000000-09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
             
         testObject.precision = 7
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#000000-09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 8
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#000000-09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))

         testObject.precision = 9
         XCTAssertEqual(testObject.convertToString(testInput)!, "1#000000-09".replaceFirstOccurrence(of: "#", with: locale.decimalSeparator!))
      
     }
    
}
