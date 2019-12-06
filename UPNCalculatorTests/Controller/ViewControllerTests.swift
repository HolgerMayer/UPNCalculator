//
//  ViewControllerTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class ViewControllerTests: XCTestCase {

    var testObject : ViewController!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
           let storyboard = UIStoryboard(name: "Main",
                                         bundle: Bundle.main)
         testObject = storyboard.instantiateInitialViewController() as! ViewController

        testObject.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonsAreAvailable() {
        XCTAssertNotNil(testObject.inputLabel)

        // Numbers
        XCTAssertNotNil(testObject.digit0Button)
        XCTAssertNotNil(testObject.digit1Button)
        XCTAssertNotNil(testObject.digit2Button)
        XCTAssertNotNil(testObject.digit3Button)
        XCTAssertNotNil(testObject.digit4Button)
        XCTAssertNotNil(testObject.digit5Button)
        XCTAssertNotNil(testObject.digit6Button)
        XCTAssertNotNil(testObject.digit7Button)
        XCTAssertNotNil(testObject.digit8Button)
        XCTAssertNotNil(testObject.digit9Button)
        
        // Operations
        XCTAssertNotNil(testObject.addButton)
        XCTAssertNotNil(testObject.subtractButton)
        XCTAssertNotNil(testObject.multiplyButton)
        XCTAssertNotNil(testObject.divideButton)

        // Else
        XCTAssertNotNil(testObject.dotButton)
        XCTAssertNotNil(testObject.enterButton)
        XCTAssertNotNil(testObject.clearButton)


    }


    func testInitialState(){
        XCTAssertTrue(testObject.inputLabel.text == "")
        XCTAssertTrue(testObject.isPushed)
        XCTAssertNotNil(testObject.calculatorEngine)
        XCTAssertNil(testObject.calculatorEngine.top)
    }
    
   func testInputFirstDigit0(){
         testObject.digitTapped(testObject.digit0Button)
         XCTAssertTrue(testObject.inputLabel.text! == "0")
         XCTAssertNil(testObject.calculatorEngine.top)
         XCTAssertFalse(testObject.isPushed)
}
    
    func testInputDigits(){
            testObject.digitTapped(testObject.digit1Button)
            testObject.digitTapped(testObject.digit2Button)
            testObject.digitTapped(testObject.digit3Button)
            testObject.digitTapped(testObject.digit4Button)
            testObject.digitTapped(testObject.digit5Button)
            testObject.digitTapped(testObject.digit6Button)
            testObject.digitTapped(testObject.digit7Button)
            testObject.digitTapped(testObject.digit8Button)
            testObject.digitTapped(testObject.digit9Button)
            testObject.digitTapped(testObject.digit0Button)
            XCTAssertTrue(testObject.inputLabel.text! == "1234567890")
            XCTAssertNil(testObject.calculatorEngine.top)
}
    
    func testInputDot(){
             testObject.digitTapped(testObject.digit1Button)
             testObject.digitTapped(testObject.digit2Button)
             testObject.digitTapped(testObject.digit3Button)
             testObject.digitTapped(testObject.dotButton)
             testObject.digitTapped(testObject.digit4Button)
             testObject.digitTapped(testObject.digit5Button)
             testObject.digitTapped(testObject.digit6Button)
             testObject.digitTapped(testObject.digit7Button)
             testObject.digitTapped(testObject.digit8Button)
             testObject.digitTapped(testObject.digit9Button)
             testObject.digitTapped(testObject.digit0Button)
             XCTAssertTrue(testObject.inputLabel.text! == "123.4567890")
             XCTAssertNil(testObject.calculatorEngine.top)
     }
    
    func testInputEnter(){
              testObject.digitTapped(testObject.digit1Button)
              XCTAssertFalse(testObject.isPushed)
              testObject.digitTapped(testObject.digit2Button)
              testObject.digitTapped(testObject.digit3Button)
              testObject.digitTapped(testObject.dotButton)
              testObject.digitTapped(testObject.digit4Button)
              testObject.digitTapped(testObject.digit5Button)
              testObject.digitTapped(testObject.digit6Button)
              testObject.digitTapped(testObject.digit7Button)
              testObject.digitTapped(testObject.digit8Button)
              testObject.digitTapped(testObject.digit9Button)
              testObject.digitTapped(testObject.digit0Button)
              testObject.enterTapped(testObject.enterButton)
              
              XCTAssertTrue(testObject.isPushed)

              XCTAssertTrue(testObject.inputLabel.text! == "123.4567890")
              XCTAssertTrue(testObject.calculatorEngine.top! == 123.456789)
      }
    
    func testInputClear(){
                testObject.digitTapped(testObject.digit1Button)
                testObject.digitTapped(testObject.digit2Button)
                testObject.digitTapped(testObject.digit3Button)
                testObject.digitTapped(testObject.dotButton)
                testObject.digitTapped(testObject.digit4Button)
                testObject.digitTapped(testObject.digit5Button)
                testObject.digitTapped(testObject.digit6Button)
                testObject.digitTapped(testObject.digit7Button)
                testObject.digitTapped(testObject.digit8Button)
                testObject.digitTapped(testObject.digit9Button)
                testObject.digitTapped(testObject.digit0Button)
                testObject.enterTapped(testObject.enterButton)
                testObject.clearTapped(testObject.clearButton)

                XCTAssertTrue(testObject.inputLabel.text! == "")
                XCTAssertNil(testObject.calculatorEngine.top)
                XCTAssertFalse(testObject.isPushed)
    }
    
    
    func testAddButton(){
        testObject.digitTapped(testObject.digit1Button)
        testObject.enterTapped(testObject.enterButton)
        testObject.digitTapped(testObject.digit2Button)
        testObject.addTapped(testObject.addButton)
        
        let result = testObject.calculatorEngine.top!
        
        XCTAssertTrue(result == 3)
        XCTAssertTrue(testObject.inputLabel.text! == "3.0")
        XCTAssertTrue(testObject.isPushed)
    }
    
    func testSubtractButton(){
          testObject.digitTapped(testObject.digit1Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit2Button)
          testObject.subtractTapped(testObject.subtractButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == -1)
          XCTAssertTrue(testObject.inputLabel.text! == "-1.0")
          XCTAssertTrue(testObject.isPushed)
      }
    
    func testMultiplyButton(){
          testObject.digitTapped(testObject.digit2Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit3Button)
          testObject.multiplyTapped(testObject.multiplyButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == 6)
          XCTAssertTrue(testObject.inputLabel.text! == "6.0")
          XCTAssertTrue(testObject.isPushed)
      }
    
    func testDivideButton(){
          testObject.digitTapped(testObject.digit6Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit2Button)
          testObject.divideTapped(testObject.divideButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == 3)
          XCTAssertTrue(testObject.inputLabel.text! == "3.0")
          XCTAssertTrue(testObject.isPushed)
      }

}
