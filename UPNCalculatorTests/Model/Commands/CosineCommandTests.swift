//
//  CosineCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class CosineCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return CosineCommand(calculatorEngine: engine, display: display)
    }
    
    func testCosineOfEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 1.0)
    }


    func testCosineOfZero() {
        
         engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
        XCTAssertTrue(result == 1.0)
     }
    
    func testCosineOfHalfPi() {
     
        engine.trigonometricMode = .rad
        
        engine.enterNumber(Double.pi / 2)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(abs(result) < 0.0001)
        
    }
    
  
    func testCosineOfPi(){
        
        engine.trigonometricMode = .rad
        
        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(1.0 + result) < 0.0001)
    }
   

    func testCosineOfHalfPiTimes3(){
        
        engine.trigonometricMode = .rad
        
          engine.enterNumber(Double.pi / 2 * 3)
          
          let _ = testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(result) < 0.0001)
      }
    
    
    func testDegCosineValues(){
              
        let testInputs : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let expectedResults : [Double] = [1,0.9397,0.8192,0.2588,-0.1736,-0.8192,-0.3420,0.3420,0.6428,0.9962]
           
        engine.trigonometricMode = .deg
           
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg cosine ",roundTo:4)

       }
       
       func testGradCosineValues(){
                
            let testInputs : [Double] = [0,20,35,75,100,145,250,290,310,355]
            let expectedResults : [Double] = [1,0.9511,0.8526,0.3827,0,-0.6494,-0.7071,-0.1564,0.1564,0.7604]
            
            engine.trigonometricMode = .grad

            validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "grad cosine ",roundTo:4)

         }
       
}
