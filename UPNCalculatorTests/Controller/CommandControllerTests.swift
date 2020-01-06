//
//  CommandControllerTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 05.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class CommandControllerTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var testObject : CommandController!
    var mockDelegate : DisplayMockDelegate!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        engine = UPNEngine()
        mockDelegate = DisplayMockDelegate()
        display = CalculatorDisplay()
        display.delegate = mockDelegate
        testObject = CommandController(calculatorEngine: engine, display: display)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
  func testFCommandPushed() {
        
        
        testObject.executeCommand(keyString:CommandKey.fKey.rawValue)
        
        
        // State Change -> Display connection is handled within CommandController class
        
        XCTAssertTrue(mockDelegate.delegate_didCall_didChangeState)
        XCTAssertNotNil(mockDelegate.delegate_param_State)
        if mockDelegate.delegate_param_State != nil {
            XCTAssertTrue(mockDelegate.delegate_param_State! == .FState)
        }
        
    }
    
    func testGCommandPushed() {
          
          
          testObject.executeCommand(keyString:CommandKey.gKey.rawValue)
          
          
          // State Change -> Display connection is handled within CommandController class
          
          XCTAssertTrue(mockDelegate.delegate_didCall_didChangeState)
          XCTAssertNotNil(mockDelegate.delegate_param_State)
          if mockDelegate.delegate_param_State != nil {
              XCTAssertTrue(mockDelegate.delegate_param_State! == .GState)
          }
          
      }
}
