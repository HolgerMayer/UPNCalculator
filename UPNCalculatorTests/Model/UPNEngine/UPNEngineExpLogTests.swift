//
//  UPNEngineExpLogTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 17.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineExpLogTests: XCTestCase {

    var testObject : UPNEngine!
     
     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
     }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExp() {
        
        testObject.enterNumber(1.0)
               
        testObject.exp()
               
        XCTAssertNotNil(testObject.top)
        XCTAssertTrue(abs(testObject.top!-2.7183) < 0.0001)
    }
      
    func testLog() {
        
        testObject.enterNumber(2.7183)
          
        do {
            try testObject.log()
                  
            XCTAssertNotNil(testObject.top)
            XCTAssertTrue(abs(testObject.top!-1) < 0.0001)
        } catch {
            XCTFail("Log from 2.7183 did  throw exception")
        }
    }
      
    func testlog10(){
        
        testObject.enterNumber(100)
                  
      
        do {
            try testObject.log10()
            XCTAssertNotNil(testObject.top)
            XCTAssertTrue(abs(testObject.top!-2) < 0.0001)
        } catch {
            XCTFail("Log10 from 100 did  throw exception")
        }
          
    }
      

}
