//
//  ASineCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class ASineCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : ASineCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        display = CalculatorDisplay()
        testObject = ASineCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testASineOfEmptyStack() {

        testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }


    func testSineOfZero() {
        
         engine.enterNumber(0.0)
        
         testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(result == 0)
     }
    
   

    func testSineOfOne(){
        
        engine.enterNumber(1.0)
          
          testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(1.5708 - result ) < 0.0001)
      }
    
}
