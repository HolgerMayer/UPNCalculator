//
//  CosineCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//


import XCTest
@testable import UPNCalculator

class CosineCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : CosineCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        engine.trigonometricMode = .rad
        display = CalculatorDisplay()
        testObject = CosineCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
     
        engine.enterNumber(Double.pi / 2)
    
        let _ = testObject.execute()
    
        guard let result = engine.top else {
           XCTFail()
           return
        }
       
        XCTAssertTrue(abs(result) < 0.0001)
        
    }
    
  
    func testCosineOfPi(){
        
        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(1.0 + result) < 0.0001)
    }
   

    func testCosineOfHalfPiTimes3(){
        
          engine.enterNumber(Double.pi / 2 * 3)
          
          let _ = testObject.execute()
          
          guard let result = engine.top else {
              XCTFail()
              return
          }
             
        XCTAssertTrue(abs(result) < 0.0001)
      }
    
    
    func testDegCosineValues(){
              
           let testValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let resultValues : [Double] = [1,0.9397,0.8192,0.2588,-0.1736,-0.8192,-0.3420,0.3420,0.6428,0.9962]
           
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

               XCTAssertTrue(resultValues[i] == checkValue, " deg cos(\(test)) should be \(resultValues[i])  is \(checkValue)")
           }
           
       }
       
       func testGradCosineValues(){
                
           let testValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let resultValues : [Double] = [1,0.9511,0.8526,0.3827,0,-0.6494,-0.7071,-0.1564,0.1564,0.7604]
             
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

                 XCTAssertTrue(resultValues[i] == checkValue, " grad cos(\(test)) should be \(resultValues[i])  is \(checkValue)")
             }
             
         }
       
}
