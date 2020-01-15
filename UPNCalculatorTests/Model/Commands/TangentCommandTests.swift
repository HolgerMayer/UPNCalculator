//
//  TangentCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class TangentCommandTests:  CommandTestCase {

   override func createTestObject() -> Command? {
       return TangentCommand(calculatorEngine: engine, display: display)
   }
   
    func testTangentOfEmptyStack() {

        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(result == 0.0)
    }


    func testTangentOfZero() {
        
         engine.enterNumber(0.0)
        
         let _ = testObject.execute()
        
        guard let result = engine.top else {
               XCTFail()
               return
           }
           
        XCTAssertTrue(result == 0.0)
     }
    
  
    
  
    func testTangentOfPi(){
        
        engine.trigonometricMode = .rad
        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

     func testTangentOfMinusPi(){
         
         engine.trigonometricMode = .rad
         engine.enterNumber(-Double.pi)
         
         let _ = testObject.execute()
         
         guard let result = engine.top else {
             XCTFail()
             return
         }
            
         XCTAssertTrue(abs(result) < 0.0001)
     }
    
  
    func testDegTangentValues(){
              
        let testInputs : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let expectedResults : [Double] = [0,0.3640,0.7002,3.7321,-5.6713,-0.7002,2.7475,-2.7475,-1.1918,-0.0875]
           
        engine.trigonometricMode = .deg
           
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "deg tangent ",roundTo:4)

           
    }
       
    // 100 -> NaN
    func testGradTangentValues(){
                
        let testInputs : [Double] = [0,20,35,75,145,250,290,310,355]
        let expectedResults : [Double] = [0,0.3249,0.6128,2.4142,-1.1708,1,6.3138,-6.3138,-0.8541]
             
        engine.trigonometricMode = .grad
             
        validateFor(testInput: testInputs, expectedResult:expectedResults, testTypeMessage: "grad tangent ",roundTo:4)

    }
       
    
}
