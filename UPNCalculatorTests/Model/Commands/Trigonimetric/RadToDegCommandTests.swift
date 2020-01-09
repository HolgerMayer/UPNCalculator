//
//  RadToDegCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 09.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class RadToDegCommandTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : RadToDegCommand!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        engine.trigonometricMode = .rad
        display = CalculatorDisplay()
        testObject = RadToDegCommand(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    


     func testRadToDegValues(){
            
         let resultValues : [Double] = [0,20,35,75,100,145,250,290,310,355]
         let testValues : [Double] = [0,0.3491,0.6109,1.3090,1.7453, 2.5307,4.3633,5.0615,5.4105,6.1959]
         
       
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
             
             
             
             let checkValue = result.roundToDecimal(0)

             XCTAssertTrue(resultValues[i] == checkValue, " RAD (\(test)) should be DEG  \(resultValues[i])  is DEG \(checkValue)")
         }
         
     }
    
}
