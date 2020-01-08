//
//  SinusCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class SineCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : SineCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        engine.trigonometricMode = .rad
        display = CalculatorDisplay()
        testObject = SineCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
     
        engine.enterNumber(Double.pi / 2)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(abs(1.0 - result) < 0.0001)
        
    }
    
  
    func testSineOfPi(){
        
        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

    func testSineOfHalfPiTimes3(){
        
        
          engine.enterNumber(Double.pi / 2 * 3)
          
         let _ =  testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(result + 1.0) < 0.0001)
      }
    
    func testDegSineValues(){
           
        let testValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let resultValues : [Double] = [0,0.3420,0.5736,0.9659,0.9848,0.5736,-0.9397,-0.9397,-0.7660,-0.0872]
        
        engine.trigonometricMode = .deg
        
        for i in 0..<testValues.count {
            engine.clear()
            let test = testValues[i]
            engine.enterNumber(test)
            display.isPushed = true
         
            let _ =  testObject.execute()
            
            guard let result = engine.top else {
                  XCTFail()
                  return
              }
            
            
            
            let checkValue = result.roundToDecimal(4)

            XCTAssertTrue(resultValues[i] == checkValue, " deg sin(\(test)) should be \(resultValues[i])  is \(checkValue)")
        }
        
    }
    
    func testGradSineValues(){
             
        let testValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let resultValues : [Double] = [0,0.3090,0.5225,0.9239,1.0,0.7604,-0.7071,-0.9877,-0.9877,-0.6494]
          
          engine.trigonometricMode = .grad
          
          for i in 0..<testValues.count {
              engine.clear()
              let test = testValues[i]
              engine.enterNumber(test)
              display.isPushed = true
           
              let _ =  testObject.execute()
              
              guard let result = engine.top else {
                    XCTFail()
                    return
                }
              
              
              
              let checkValue = result.roundToDecimal(4)

              XCTAssertTrue(resultValues[i] == checkValue, " grad sin(\(test)) should be \(resultValues[i])  is \(checkValue)")
          }
          
      }
    
}
