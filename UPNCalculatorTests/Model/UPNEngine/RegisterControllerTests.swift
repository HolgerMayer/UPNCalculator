//
//  RegisterControllerTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 30.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


import XCTest
@testable import UPNCalculator

class RegisterControllerTests: XCTestCase {

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

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testClear() {
        for i in 0..<testObject.register.count {
            testObject.register[i] = Double(i+1)
        }
        
        testObject.clear()
        
        for i in 0..<testObject.register.count{
             XCTAssertEqual(testObject.register[i] ,0)
         }

    }
    
    func testClearStatisticRegister() {
        for i in 0..<testObject.register.count {
            testObject.register[i] = Double(i+1)
        }
           
        testObject.clearStatisticRegisters()
           
        XCTAssertEqual(testObject.register[0] ,1.0)
        XCTAssertEqual(testObject.register[1] ,2.0)

        for i in 3..<8 {
            XCTAssertEqual(testObject.register[i] ,0.0)
        }
        
        for i in 8..<testObject.register.count{
            XCTAssertEqual(testObject.register[i] ,Double(i+1))
        }

    }
    
    
    func testStoreToRegister0() {
        
        testObject.intializeStoreOperation()
        testObject.actionOnRegister(registerIndex: 0)
        
        XCTAssertEqual(testObject.register[0],1)
    }
  
    func testStoreToRegister1() {
        
        testObject.intializeStoreOperation()
        testObject.actionOnRegister(registerIndex: 1)
         
        XCTAssertEqual(testObject.register[1],1)

    }

    func testStoreToRegister11() {
         testObject.intializeStoreOperation()
         testObject.setRegisterIndex10()
         testObject.actionOnRegister(registerIndex: 1)
          
         XCTAssertEqual(testObject.register[11],1)

    }

    func testStoreAndAddToRegister1() {
         testObject.register[1] = 23
        
         testObject.intializeStoreOperation()
         testObject.setCalculationOperation(.Add)
         testObject.actionOnRegister(registerIndex: 1)
          
         XCTAssertEqual(testObject.register[1],24)

    }

    func testStoreAndSubtractToRegister11() {
         testObject.register[11] = 23
        
         testObject.intializeStoreOperation()
         testObject.setCalculationOperation(.Subtract)
         testObject.setRegisterIndex10()
         testObject.actionOnRegister(registerIndex: 1)
          
         XCTAssertEqual(testObject.register[11],22)
    }

    func testStoreAndDivideToRegister1() {
        engine.enterNumber(2)
        testObject.register[1] = 24
               
        testObject.intializeStoreOperation()
        testObject.setCalculationOperation(.Divide)
        testObject.actionOnRegister(registerIndex: 1)
                
        XCTAssertEqual(testObject.register[1],12)
        
    }

    func testStoreAndMultipyToRegister11() {
         engine.enterNumber(2)
         testObject.register[11] = 24
                
         testObject.intializeStoreOperation()
         testObject.setCalculationOperation(.Multiply)
         testObject.setRegisterIndex10()
         testObject.actionOnRegister(registerIndex: 1)
                 
         XCTAssertEqual(testObject.register[11],48)

    }
    
    func testRecallFromRegister1() {
        testObject.register[1] = 23
        
        testObject.initializeRecallOperation()
        testObject.actionOnRegister(registerIndex: 1)
         
        XCTAssertEqual(testObject.register[1],23)
        XCTAssertEqual(engine.stack.peek(register: .X),23)
    }

    func testRecallRegister11() {
        testObject.register[11] = 42
          
        testObject.initializeRecallOperation()
        testObject.setRegisterIndex10()
        testObject.actionOnRegister(registerIndex: 1)
           
        XCTAssertEqual(testObject.register[11],42)
        XCTAssertEqual(engine.stack.peek(register: .X),42)

    }

    func testRecallAndAddFromRegister1() {
        testObject.register[1] = 42
           
        testObject.initializeRecallOperation()
        testObject.setCalculationOperation(.Add)

        testObject.actionOnRegister(registerIndex: 1)
            
        XCTAssertEqual(testObject.register[1],42)
        XCTAssertEqual(engine.stack.peek(register: .X),43)

    }

    func testRecallAndSubtractFromRegister11() {
        testObject.register[11] = 42
           
        testObject.initializeRecallOperation()
        testObject.setCalculationOperation(.Subtract)
        testObject.setRegisterIndex10()
        testObject.actionOnRegister(registerIndex: 1)
            
        XCTAssertEqual(testObject.register[11],42)
        XCTAssertEqual(engine.stack.peek(register: .X),-41)

    }

    func testRecallAndDivideFromRegister1() {
         engine.enterNumber(42.0)
         testObject.register[1] = 2
              
         testObject.initializeRecallOperation()
         testObject.setCalculationOperation(.Divide)
         testObject.actionOnRegister(registerIndex: 1)
               
         XCTAssertEqual(testObject.register[1],2)
         XCTAssertEqual(engine.stack.peek(register: .X),21)

    }

    func testRecallAndMultipyFromRegister11() {
         engine.enterNumber(2.0)
         testObject.register[11] = 42
              
         testObject.initializeRecallOperation()
         testObject.setCalculationOperation(.Multiply)
         testObject.setRegisterIndex10()
         testObject.actionOnRegister(registerIndex: 1)
               
         XCTAssertEqual(testObject.register[11],42)
         XCTAssertEqual(engine.stack.peek(register: .X),84)
    }
    
    func testStoreToRegisterOver9Index(){
            engine.enterNumber(2.0)
            testObject.register[11] = 42
                     
            testObject.initializeRecallOperation()
            testObject.setCalculationOperation(.Multiply)
            testObject.actionOnRegister(registerIndex: 11)
                      
            XCTAssertEqual(testObject.register[11],42)
            XCTAssertEqual(engine.stack.peek(register: .X),2)
        
    }
}
