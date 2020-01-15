//
//  SinusCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class SineCommandTests: CommandTestCase {

    override func createTestObject() -> Command? {
        return SineCommand(calculatorEngine: engine, display: display)
    }
   
    
    func testSineOfEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0)
    }


    func testSineOfZero() {
        
         engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
         XCTAssertTrue(result == 0)
     }
    
    func testSineOfHalfPi() {
        
        engine.trigonometricMode = .rad
     
        engine.enterNumber(Double.pi / 2)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(abs(1.0 - result) < 0.0001)
        
    }
    
  
    func testSineOfPi(){
     
        engine.trigonometricMode = .rad

        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

    func testSineOfHalfPiTimes3(){
        
        engine.trigonometricMode = .rad

          engine.enterNumber(Double.pi / 2 * 3)
          
         let _ =  testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(result + 1.0) < 0.0001)
      }
    
    func testDegSineValues(){
           
        let testInputs : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let expectedResults : [Double] = [0,0.3420,0.5736,0.9659,0.9848,0.5736,-0.9397,-0.9397,-0.7660,-0.0872]
        
        engine.trigonometricMode = .deg
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg sin ",roundTo:4)

    }
    
    func testGradSineValues(){
             
        let testInputs : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let expectedResults : [Double] = [0,0.3090,0.5225,0.9239,1.0,0.7604,-0.7071,-0.9877,-0.9877,-0.6494]
          
        engine.trigonometricMode = .grad
        
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "Grad sin ",roundTo:4)
    }
    
}
