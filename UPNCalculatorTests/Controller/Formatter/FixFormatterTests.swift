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

    var testObject : FixFormatter!
    
     
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
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
         XCTAssertTrue(result! == "-0.1000    ", "result should be -0.1000..... is \(result!)")

    }
    
    func testFormatToStringSmallValuePrecisionFour() {
        
        let testInput = 123.4567890123
        testObject.precision = 4
        
        let result = testObject.convertToString(testInput)
       
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == "123.4568   ", "result should be 123.4568... is \(result!)")
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
        XCTAssertTrue(result! == "1.2346   11", "result should be 1.2346...11 is \(result!)")
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
         XCTAssertTrue(testObject.convertToString(testInput)! == "1        11", "result should be 1........11 is \(testObject.convertToString(testInput)!)")
        
         testObject.precision = 1
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.2      11", "result should be 1.2......11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 2
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.23     11", "result should be 1.23.....11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 3
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.235    11", "result should be 1.235....11 is \(testObject.convertToString(testInput)!)")
        
        testObject.precision = 4
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.2346   11", "result should be 1.2346...11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 5
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.23457  11", "result should be 1.23457..11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 6
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.234568 11", "result should be 1.234568.11 is \(testObject.convertToString(testInput)!)")
        
        testObject.precision = 7
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.234568 11", "result should be 1.234568.11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 8
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.234568 11", "result should be 1.234568.11 is \(testObject.convertToString(testInput)!)")

        testObject.precision = 9
        XCTAssertTrue(testObject.convertToString(testInput)! == "1.234568 11", "result should be 1.234568.11 is \(testObject.convertToString(testInput)!)")
 
    }
    
    
     func testPrecisionVariantsNegativeExponentLargeValue(){
        let testInput = 0.0001

        testObject.precision = 0
        XCTAssertTrue(testObject.convertToString(testInput)! == "0          ", "result should be 0.......... is !\(testObject.convertToString(testInput)!)!")
            
        testObject.precision = 1
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.0        ", "result should be 0.0........ is \(testObject.convertToString(testInput)!)")

        testObject.precision = 2
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.00       ", "result should be 0.00....... is \(testObject.convertToString(testInput)!)")

        testObject.precision = 3
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.000      ", "result should be 0.000...... is \(testObject.convertToString(testInput)!)")
            
        testObject.precision = 4
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.0001     ", "result should be 0.0001..... is \(testObject.convertToString(testInput)!)")

        testObject.precision = 5
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.00010    ", "result should be 0.00010.... is \(testObject.convertToString(testInput)!)")

        testObject.precision = 6
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.000100   ", "result should be 0.000100... is \(testObject.convertToString(testInput)!)")
            
        testObject.precision = 7
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.0001000  ", "result should be 0.0001000.. is \(testObject.convertToString(testInput)!)")

        testObject.precision = 8
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.00010000 ", "result should be 0.00010000. is \(testObject.convertToString(testInput)!)")

        testObject.precision = 9
        XCTAssertTrue(testObject.convertToString(testInput)! == "0.000100000", "result should be 10.000100000s is \(testObject.convertToString(testInput)!)")
     
    }

    func testPrecisionVariantsNegativeExponentSmallValue(){
         let testInput = 0.000000001

         testObject.precision = 0
         XCTAssertTrue(testObject.convertToString(testInput)! == "1       -09", "result should be 1       -09 is \(testObject.convertToString(testInput)!)")
             
         testObject.precision = 1
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.0     -09", "result should be 1.0     -09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 2
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.00    -09", "result should be 1.00    -09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 3
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.000   -09", "result should be 1.000   -09 is \(testObject.convertToString(testInput)!)")
             
         testObject.precision = 4
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.0000  -09", "result should be 1.0000  -09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 5
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.00000 -09", "result should be 1.0000 -09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 6
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.000000-09", "result should be 1.00000-09  is \(testObject.convertToString(testInput)!)")
             
         testObject.precision = 7
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.000000-09", "result should be 1.00000-09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 8
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.000000-09", "result should be 1.00000-09 is \(testObject.convertToString(testInput)!)")

         testObject.precision = 9
         XCTAssertTrue(testObject.convertToString(testInput)! == "1.000000-09", "result should be 1.00000-09 is \(testObject.convertToString(testInput)!)")
      
     }
    
}
