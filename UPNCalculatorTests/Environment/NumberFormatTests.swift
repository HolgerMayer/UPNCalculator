//
//  NumberFormatTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 29.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class NumberFormatTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertStringToDoubleWithDot() {
      
        let numberString = "123.001"
        
        // This won't work
        // let numberString = "123.001   "
        // allways remove trailing spaces before conversion!!!
        
        
        
        guard let result = Double(numberString) else {
            XCTFail("Conversion of \(numberString) to Double failed")
            return
        }

        XCTAssertTrue(result == 123.001 ," should be 123.001 is \(result)")
        
    }

   
}
