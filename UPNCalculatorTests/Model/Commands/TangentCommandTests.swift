//
//  TangentCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 14.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class TangentCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : TangentCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        engine.trigonometricMode = .rad
        display = CalculatorDisplay()
        testObject = TangentCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        
        engine.enterNumber(Double.pi)
        
        let _ = testObject.execute()
        
        guard let result = engine.top else {
            XCTFail()
            return
        }
           
        XCTAssertTrue(abs(result) < 0.0001)
    }
   

     func testTangentOfMinusPi(){
         
         engine.enterNumber(-Double.pi)
         
         let _ = testObject.execute()
         
         guard let result = engine.top else {
             XCTFail()
             return
         }
            
         XCTAssertTrue(abs(result) < 0.0001)
     }
    
  
    func testDegTangentValues(){
              
        let testValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
        let resultValues : [Double] = [0,0.3640,0.7002,3.7321,-5.6713,-0.7002,2.7475,-2.7475,-1.1918,-0.0875]
           
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

               XCTAssertTrue(resultValues[i] == checkValue, " deg tan(\(test)) should be \(resultValues[i])  is \(checkValue)")
           }
           
       }
       
       // 100 -> NaN
       func testGradTangentValues(){
                
           let testValues : [Double] = [0,20,35,75,145,250,290,310,355]
        let resultValues : [Double] = [0,0.3249,0.6128,2.4142,-1.1708,1,6.3138,-6.3138,-0.8541]
             
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

                 XCTAssertTrue(resultValues[i] == checkValue, " grad tan(\(test)) should be \(resultValues[i])  is \(checkValue)")
             }
             
         }
       
    
}
