//
//  TrigonometricConverterTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 08.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class TrigonometricConverterTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testConvertDegToRad() {
       
        let result1 =  TrigonometricConverter.convertDegToRad(40.5)
        var checkValue = result1.roundToDecimal(4)
        
        XCTAssertTrue(checkValue == 0.7069, "result is \(checkValue)")
        
        let result2 = TrigonometricConverter.convertRadToDeg(result1)
        
        checkValue = result2.roundToDecimal(4)
        
        XCTAssertTrue(checkValue == 40.5, "result is \(checkValue)")
}
    
    
    func testConvertGRadToRad() {
         let result1 =  TrigonometricConverter.convertGradToRad(636.6197723676)
         var checkValue = result1.roundToDecimal(4)
         
         XCTAssertTrue(checkValue == 10.0, "result is \(checkValue)")
         
         let result2 = TrigonometricConverter.convertRadToGrad(result1)
         
         checkValue = result2.roundToDecimal(4)
         
         XCTAssertTrue(checkValue == 636.6198, "result is \(checkValue)")

    }

    

}
