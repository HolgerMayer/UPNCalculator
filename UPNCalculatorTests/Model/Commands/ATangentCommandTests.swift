//
//  ATangentCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import Foundation

import XCTest
@testable import UPNCalculator

class ATangentCommandTests:  CommandTestCase {

 override func createTestObject() -> Command? {
     return ATangentCommand(calculatorEngine: engine, display: display)
 }
  
  
    
    
    func testATangentOfEmptyStack() {

        engine.trigonometricMode = .rad
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(result) < 0.0001)
    }


    func testTangentOfZero() {
        
        engine.trigonometricMode = .rad
        engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(abs(result) < 0.0001)
     }
    
   

    func testTangentOfOne(){

        engine.trigonometricMode = .rad

        engine.enterNumber(1.0)
          
          let _ = testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs( result - 0.7854) < 0.0001)
      }
    
}
