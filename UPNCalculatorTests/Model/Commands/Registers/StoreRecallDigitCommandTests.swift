//
//  StoreRecallDigitCommandTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 03.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class StoreRecallDigitCommandTests: XCTestCase {
 
    var engine : UPNEngine!
    var registerController : RegisterController!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        registerController = RegisterController()
        registerController.delegate = engine
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
        
    }

    func testStoreDigit1Command(){
        engine.enterNumber(22)
        
        registerController.registerAccess = .Store
        registerController.registerAccessIndex = 0
        registerController.registerAccessOperation = .None
        
        let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"1")
         
         let result = testObject.execute()
                  
        XCTAssertTrue(registerController.register[1] == 22)
        XCTAssertTrue(registerController.registerAccess == .None)

        XCTAssertTrue(result == .Default)

    }
    
    func testStoreDigit14Command(){
          engine.enterNumber(24)
          
          registerController.registerAccess = .Store
          registerController.registerAccessIndex = 10
          registerController.registerAccessOperation = .None
          
          let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
           
          let result = testObject.execute()
                    
          XCTAssertTrue(registerController.register[14] == 24)
          XCTAssertTrue(registerController.registerAccess == .None)

          XCTAssertTrue(result == .Default)
    }
    
    
    
    
    func testRecallDigit2Command(){
        registerController.register[2] = 11
        registerController.registerAccess = .Recall
        registerController.registerAccessIndex = 0
        registerController.registerAccessOperation = .None
    
        let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"2")
           
        let result = testObject.execute()
                    
        XCTAssertTrue(result == .Default)
        
        guard let value = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(value == 11)
        XCTAssertTrue(registerController.registerAccess == .None)

         
     }
     
     func testRecallDigit12Command(){
        registerController.register[12] = 33
        registerController.registerAccess = .Recall
        registerController.registerAccessIndex = 10
        registerController.registerAccessOperation = .None
         
        let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"2")
                
        let result = testObject.execute()
                         
        XCTAssertTrue(result == .Default)
             
        guard let value = engine.top else {
            XCTFail()
            return
        }
             
        XCTAssertTrue(value == 33)
        XCTAssertTrue(registerController.registerAccess == .None)
     }

    //
    // MARK: Store Operations
    //

    func testStoreDigit14CommandAdd(){
       registerController.register[14] = 100
        
       engine.enterNumber(24)
       
       registerController.registerAccess = .Store
       registerController.registerAccessIndex = 10
       registerController.registerAccessOperation = .Add
       
       let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
        
       let result = testObject.execute()
                 
       XCTAssertTrue(registerController.register[14] == 124)
       XCTAssertTrue(registerController.registerAccess == .None)

       XCTAssertTrue(result == .Default)
    }

    func testStoreDigit14CommandSubtract(){
       registerController.register[14] = 100

       engine.enterNumber(24)
       
       registerController.registerAccess = .Store
       registerController.registerAccessIndex = 10
       registerController.registerAccessOperation = .Subtract
       
       let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
        
       let result = testObject.execute()
                 
       XCTAssertEqual(registerController.register[14], 76.0)
       XCTAssertTrue(registerController.registerAccess == .None)

       XCTAssertTrue(result == .Default)
    }

    func testStoreDigit14CommandMultiply(){
        registerController.register[14] = 2
        
       engine.enterNumber(24)
       
       registerController.registerAccess = .Store
       registerController.registerAccessIndex = 10
       registerController.registerAccessOperation = .Multiply
       
       let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
        
       let result = testObject.execute()
                 
       XCTAssertEqual(registerController.register[14], 48.0)
       XCTAssertTrue(registerController.registerAccess == .None)

       XCTAssertTrue(result == .Default)
    }

    func testStoreDigit14CommandDivide(){
        registerController.register[14] = 48
        
       engine.enterNumber(24)
       
       registerController.registerAccess = .Store
       registerController.registerAccessIndex = 10
       registerController.registerAccessOperation = .Divide
       
       let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
        
       let result = testObject.execute()
                 
        
       XCTAssertEqual(registerController.register[14],2.0)
       XCTAssertTrue(registerController.registerAccess == .None)

       XCTAssertTrue(result == .Default)
    }
    
    
    func testStoreDigit14CommandDivideByZero(){
          registerController.register[14] = 48
          
         engine.enterNumber(0)
         
         registerController.registerAccess = .Store
         registerController.registerAccessIndex = 10
         registerController.registerAccessOperation = .Divide
         
         let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
          
         let result = testObject.execute()
          
         XCTAssertEqual(registerController.register[14],48)
         XCTAssertTrue(registerController.registerAccess == .None)
         XCTAssertTrue(mockDelegate.delegate_param1 == "Error : division by zero")

         XCTAssertTrue(result == .Default)
      }

    
    //
    // MARK: Recall operations
    //
    
    func testRecallDigit14CommandAdd(){
         registerController.register[14] = 25
          
         engine.enterNumber(100)
         
         registerController.registerAccess = .Recall
         registerController.registerAccessIndex = 10
         registerController.registerAccessOperation = .Add
         
         let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
          
         let result = testObject.execute()
        
         XCTAssertTrue(result == .Default)

         XCTAssertTrue(registerController.register[14] == 25)
         XCTAssertTrue(registerController.registerAccess == .None)
        
         guard let value = display.value else {
            XCTFail()
            return
         }
        
         XCTAssertEqual(value,125)
      }

      func testRecallDigit14CommandSubtract(){
         registerController.register[14] = 24

         engine.enterNumber(100)
         
         registerController.registerAccess = .Recall
         registerController.registerAccessIndex = 10
         registerController.registerAccessOperation = .Subtract
         
         let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
          
         let result = testObject.execute()
            
         XCTAssertTrue(result == .Default)
        
         XCTAssertEqual(registerController.register[14], 24.0)
         XCTAssertTrue(registerController.registerAccess == .None)

         guard let value = display.value else {
            XCTFail()
            return
         }
        
         XCTAssertEqual(value,76)


      }

      func testRecallDigit14CommandMultiply(){
          registerController.register[14] = 2
          
         engine.enterNumber(24)
         
         registerController.registerAccess = .Recall
         registerController.registerAccessIndex = 10
         registerController.registerAccessOperation = .Multiply
         
         let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
          
         let result = testObject.execute()
     
        XCTAssertTrue(result == .Default)

         XCTAssertEqual(registerController.register[14], 2)
         XCTAssertTrue(registerController.registerAccess == .None)

         guard let value = display.value else {
            XCTFail()
            return
         }
        
         XCTAssertEqual(value,48)

       }

      func testRecallDigit14CommandDivide(){
          registerController.register[14] = 24
          
         engine.enterNumber(48)
         
         registerController.registerAccess = .Recall
         registerController.registerAccessIndex = 10
         registerController.registerAccessOperation = .Divide
         
         let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
          
         let result = testObject.execute()
                   
         XCTAssertTrue(result == .Default)
          
         XCTAssertEqual(registerController.register[14],24)
         XCTAssertTrue(registerController.registerAccess == .None)

         
        guard let value = display.value else {
             XCTFail()
             return
          }
         
          XCTAssertEqual(value,2)
      }
    
    func testRecallDigit14CommandDivideByZero(){
         registerController.register[14] = 0
         
        engine.enterNumber(48)
        
        registerController.registerAccess = .Recall
        registerController.registerAccessIndex = 10
        registerController.registerAccessOperation = .Divide
        
        let testObject = StoreRecallDigitCommand(calculatorEngine: engine, display: display, registerController: registerController,token:"4")
         
        let result = testObject.execute()
                  
        XCTAssertTrue(result == .Default)
         
        XCTAssertEqual(registerController.register[14],0)
        XCTAssertTrue(registerController.registerAccess == .None)
        XCTAssertTrue(mockDelegate.delegate_param1 == "Error : division by zero")

     
        
    }

}
