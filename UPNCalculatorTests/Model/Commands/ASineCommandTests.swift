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

class ASineCommandTests:  CommandTestCase {

   override func createTestObject() -> Command? {
       return ASineCommand(calculatorEngine: engine, display: display)
   }
    
    
    func testASineOfEmptyStack() {

        engine.trigonometricMode = .rad

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }


    func testSineOfZero() {
        
        engine.trigonometricMode = .rad

        engine.enterNumber(0.0)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(result == 0)
     }
    
   

    func testSineOfOne() {
        
        engine.trigonometricMode = .rad
        engine.enterNumber(1.0)
          
          let _ = testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(1.5708 - result ) < 0.0001)
      }
    
}
