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
        XCTAssertNotNil(testObject.outputLabel)

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

        XCTAssertNotNil(testObject.sqrtButton)
        XCTAssertNotNil(testObject.xovereButton)
        XCTAssertNotNil(testObject.xover10Button)
        XCTAssertNotNil(testObject.xoveryButton)
        XCTAssertNotNil(testObject.onedivxButton)

        XCTAssertNotNil(testObject.sinButton)
        XCTAssertNotNil(testObject.cosButton)
        XCTAssertNotNil(testObject.tanButton)

        
        // Else
        XCTAssertNotNil(testObject.dotButton)
        XCTAssertNotNil(testObject.enterButton)
        XCTAssertNotNil(testObject.clearButton)
        XCTAssertNotNil(testObject.chsButton)


    }


    func testInitialState(){
        XCTAssertTrue(testObject.outputLabel.text == "")
        XCTAssertFalse(testObject.isPushed())
        XCTAssertNotNil(testObject.calculatorEngine)
        XCTAssertNil(testObject.calculatorEngine.top)
    }
    
   func testInputFirstDigit0(){
         testObject.digitTapped(testObject.digit0Button)
         XCTAssertTrue(testObject.outputLabel.text! == "0")
         XCTAssertNil(testObject.calculatorEngine.top)
         XCTAssertFalse(testObject.isPushed())
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
            XCTAssertTrue(testObject.outputLabel.text! == "1234567890")
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
             XCTAssertTrue(testObject.outputLabel.text! == "123.4567890")
             XCTAssertNil(testObject.calculatorEngine.top)
     }
    
    func testInputEnter(){
              testObject.digitTapped(testObject.digit1Button)
              XCTAssertFalse(testObject.isPushed())
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
              
              XCTAssertTrue(testObject.isPushed())

              XCTAssertTrue(testObject.outputLabel.text! == "123.4567890")
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

                XCTAssertTrue(testObject.outputLabel.text! == "")
                XCTAssertNil(testObject.calculatorEngine.top)
                XCTAssertFalse(testObject.isPushed())
    }
    
    
    func testAddButton(){
        testObject.digitTapped(testObject.digit1Button)
        testObject.enterTapped(testObject.enterButton)
        testObject.digitTapped(testObject.digit2Button)
        testObject.addTapped(testObject.addButton)
        
        let result = testObject.calculatorEngine.top!
        
        XCTAssertTrue(result == 3)
        XCTAssertTrue(testObject.outputLabel.text! == "3.0")
        XCTAssertTrue(testObject.isPushed())
    }
    
    func testSubtractButton(){
          testObject.digitTapped(testObject.digit1Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit2Button)
          testObject.subtractTapped(testObject.subtractButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == -1)
          XCTAssertTrue(testObject.outputLabel.text! == "-1.0")
          XCTAssertTrue(testObject.isPushed())
      }
    
    func testMultiplyButton(){
          testObject.digitTapped(testObject.digit2Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit3Button)
          testObject.multiplyTapped(testObject.multiplyButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == 6)
          XCTAssertTrue(testObject.outputLabel.text! == "6.0")
          XCTAssertTrue(testObject.isPushed())
      }
    
    func testDivideButton(){
          testObject.digitTapped(testObject.digit6Button)
          testObject.enterTapped(testObject.enterButton)
          testObject.digitTapped(testObject.digit2Button)
          testObject.divideTapped(testObject.divideButton)
          
          let result = testObject.calculatorEngine.top!
          
          XCTAssertTrue(result == 3)
          XCTAssertTrue(testObject.outputLabel.text! == "3.0")
          XCTAssertTrue(testObject.isPushed())
      }
    
    func testChsButton(){
        testObject.digitTapped(testObject.digit6Button)
        
        testObject.chsTapped(testObject.chsButton)
        
        XCTAssertTrue(testObject.outputLabel.text! == "-6.0")
        XCTAssertFalse(testObject.isPushed())
        
        testObject.chsTapped(testObject.chsButton)
        XCTAssertTrue(testObject.outputLabel.text! == "6.0")
        XCTAssertFalse(testObject.isPushed())
    }
    
    
    func testSinButton(){
         enterHalfPi()
        
         testObject.sinTapped(testObject.sinButton)
        
         let result1 = Double(testObject.outputLabel.text! )
         XCTAssertTrue(abs(1.0 - result1!) < 0.0001)
         XCTAssertTrue(testObject.isPushed())
       
         enterPi()
          
         testObject.sinTapped(testObject.sinButton)
          
         let result2 = Double(testObject.outputLabel.text! )
         XCTAssertTrue(abs(result2!) < 0.0001)
         XCTAssertTrue(testObject.isPushed())
      }
    
    func testCosButton(){
          testObject.digitTapped(testObject.digit0Button)
          testObject.cosTapped(testObject.cosButton)
        
          let result1 = Double(testObject.outputLabel.text! )
          XCTAssertTrue(abs(1.0 - result1!) < 0.0001)
          XCTAssertTrue(testObject.isPushed())
        
        
          enterHalfPi()
         
          testObject.cosTapped(testObject.cosButton)
         
          let result2 = Double(testObject.outputLabel.text! )
          XCTAssertTrue(abs(result2!) < 0.0001)
          XCTAssertTrue(testObject.isPushed())
        
          enterPi()
           
          testObject.cosTapped(testObject.cosButton)
           
          let result3 = Double(testObject.outputLabel.text! )
          XCTAssertTrue(abs(1 + result3!) < 0.0001)
          XCTAssertTrue(testObject.isPushed())

       }
    
    func testTanButton(){
        testObject.digitTapped(testObject.digit0Button)
        testObject.tanTapped(testObject.tanButton)
   
        let result1 = Double(testObject.outputLabel.text! )
        XCTAssertTrue(abs(result1!) < 0.0001)
        XCTAssertTrue(testObject.isPushed())
   
        enterPi()
      
        testObject.tanTapped(testObject.tanButton)
      
        let result3 = Double(testObject.outputLabel.text! )
        XCTAssertTrue(abs(result3!) < 0.0001)
        XCTAssertTrue(testObject.isPushed())

    }

    
    func enterPi(){
        testObject.digitTapped(testObject.digit3Button)
        testObject.digitTapped(testObject.dotButton)
        testObject.digitTapped(testObject.digit1Button)
        testObject.digitTapped(testObject.digit4Button)
        testObject.digitTapped(testObject.digit1Button)
        testObject.digitTapped(testObject.digit5Button)
        testObject.digitTapped(testObject.digit9Button)
        testObject.enterTapped(testObject.enterButton)
    }
    
    func enterHalfPi(){
        testObject.digitTapped(testObject.digit1Button)
        testObject.digitTapped(testObject.dotButton)
        testObject.digitTapped(testObject.digit5Button)
        testObject.digitTapped(testObject.digit7Button)
        testObject.digitTapped(testObject.digit0Button)
        testObject.digitTapped(testObject.digit7Button)
        testObject.digitTapped(testObject.digit9Button)
        testObject.digitTapped(testObject.digit6Button)
        testObject.enterTapped(testObject.enterButton)

    }
}
