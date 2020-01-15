//
//  ACosineCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

import XCTest
@testable import UPNCalculator

class ACosineCommandTests:  CommandTestCase {

  override func createTestObject() -> Command? {
      return ACosineCommand(calculatorEngine: engine, display: display)
  }
   
    
    func testACosineOfEmptyStack() {

        engine.trigonometricMode = .rad
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(1.5708 - result) < 0.0001)
    }


    func testCosineOfZero() {
        
         engine.trigonometricMode = .rad
        engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(abs(1.5708 - result) < 0.0001)
     }
    
   

    func testCosineOfOne(){
        
        engine.trigonometricMode = .rad
        engine.enterNumber(1.0)
          
          let _ = testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs( result ) < 0.0001)
      }
    
}
