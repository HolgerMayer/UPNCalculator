//
//  RegisterControllerStatisticsTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//



import XCTest
@testable import UPNCalculator

class RegisterControllerStatisticsTests: XCTestCase {

    var engine : UPNEngine!
    var testObject : RegisterController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        testObject = RegisterController()
        testObject.delegate = engine
        
        engine.enterNumber(4)
        engine.enterNumber(3)
        engine.enterNumber(2)
        engine.enterNumber(1)
        testObject.clear()

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSingleAddEntry(){
        engine.enterNumber(5)
        engine.enterNumber(3)
        
        testObject.sumAdd()
        
        XCTAssertEqual(testObject.register[2],1)
        XCTAssertEqual(testObject.register[3],3)
        XCTAssertEqual(testObject.register[4],9)
        XCTAssertEqual(testObject.register[5],5)
        XCTAssertEqual(testObject.register[6],25)
        XCTAssertEqual(testObject.register[7],15)
    }
    
    func testMultipleAddEntries(){
        engine.enterNumber(5)
        engine.enterNumber(3)
         
        testObject.sumAdd()
         
        engine.enterNumber(7)
        engine.enterNumber(2)

        testObject.sumAdd()
        
        XCTAssertEqual(testObject.register[2],2)
        XCTAssertEqual(testObject.register[3],5)
        XCTAssertEqual(testObject.register[4],13)
        XCTAssertEqual(testObject.register[5],12)
        XCTAssertEqual(testObject.register[6],74)
        XCTAssertEqual(testObject.register[7],29)

    }
    
    func testSingleSubtractEntry(){
        engine.enterNumber(5)
        engine.enterNumber(3)
           
        testObject.sumSubtract()
           
        XCTAssertEqual(testObject.register[2],-1)
        XCTAssertEqual(testObject.register[3],-3)
        XCTAssertEqual(testObject.register[4],-9)
        XCTAssertEqual(testObject.register[5],-5)
        XCTAssertEqual(testObject.register[6],-25)
        XCTAssertEqual(testObject.register[7],-15)

    }
      
    func testMultipleSubtractEntries(){
        engine.enterNumber(5)
        engine.enterNumber(3)
           
        testObject.sumSubtract()
           
        engine.enterNumber(7)
        engine.enterNumber(2)

        testObject.sumSubtract()
          
        XCTAssertEqual(testObject.register[2],-2)
        XCTAssertEqual(testObject.register[3],-5)
        XCTAssertEqual(testObject.register[4],-13)
        XCTAssertEqual(testObject.register[5],-12)
        XCTAssertEqual(testObject.register[6],-74)
        XCTAssertEqual(testObject.register[7],-29)

    }

    func testAnotherMultipleAddEntries(){
        engine.enterNumber(4.63)
        engine.enterNumber(0)
        
        testObject.sumAdd()
        
        engine.enterNumber(4.78)
        engine.enterNumber(20)
        
        testObject.sumAdd()
        
        engine.enterNumber(6.61)
        engine.enterNumber(40)
        
        testObject.sumAdd()
        
        engine.enterNumber(7.21)
        engine.enterNumber(60)
        
        testObject.sumAdd()
        
        engine.enterNumber(7.78)
        engine.enterNumber(80)
        
        testObject.sumAdd()

        XCTAssertEqual(testObject.register[2],5)
        XCTAssertEqual(testObject.register[3],200)
        XCTAssertEqual(testObject.register[4],12000)
        XCTAssertEqual(testObject.register[5],31.01, accuracy:0.01)
        XCTAssertEqual(testObject.register[6],200.49, accuracy:0.01)
        XCTAssertEqual(testObject.register[7],1415)
     }

    func testMean(){
        let testSetup = StatisticsTestsSetup()
        let display = CalculatorDisplay()
        
        testSetup.setupFarmerStatistic(engine: engine, display: display, registerController: testObject)
        
        do {
            try testObject.calculateMean()
        } catch {
            XCTFail()
        }
        
        XCTAssertEqual(engine.peek(register: .X)!,40.0, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,6.40, accuracy:0.01)

    }
    
    func testStandardDeviation(){
        let testSetup = StatisticsTestsSetup()
        let display = CalculatorDisplay()
        
        testSetup.setupFarmerStatistic(engine: engine, display: display, registerController: testObject)
        
        do {
            try testObject.calculateStandardDeviation()
        } catch {
            XCTFail()
        }
        
        XCTAssertEqual(engine.peek(register: .X)!,31.62, accuracy:0.01)
        XCTAssertEqual(engine.peek(register: .Y)!,1.24, accuracy:0.01)
        
    }
    
    
}
