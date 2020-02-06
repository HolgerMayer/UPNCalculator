//
//  UPNEngineStatisticsTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineStatisticsTests: XCTestCase {

    var testObject : UPNEngine!
     
    override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
         testObject = UPNEngine()
    }

    override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPermutations()  {
        testObject.enterNumber(5.0)
        testObject.enterNumber(3.0)
        do {
            try testObject.permutations()
        } catch {
            XCTFail()
        }
        
        XCTAssertTrue(testObject.top! == 60.0)
    }
    
    func testCombinations()  {
          testObject.enterNumber(52.0)
          testObject.enterNumber(4.0)
          do {
              try testObject.combinations()
          } catch {
              XCTFail()
          }
          
          XCTAssertTrue(testObject.top! == 270725.0)
      }
    
}
