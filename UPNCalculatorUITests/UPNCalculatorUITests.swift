//
//  UPNCalculatorUITests.swift
//  UPNCalculatorUITests
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class UPNCalculatorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAdd1Plus2Equals3() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
         
        app.buttons["digit1"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit4"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit2"].tap()
        app.buttons["add"].tap()

        let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
        XCTAssertEqual(labelText, "3.4")
        
    }
    
    
    func testSubtract2From1EqualsMinus1() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
         
        app.buttons["digit1"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit2"].tap()
        app.buttons["subtract"].tap()

        let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
        XCTAssertEqual(labelText, "-1.0")
        
    }
    
    
    func testMultiply2by3equals6() {
           // UI tests must launch the application that they test.
           let app = XCUIApplication()
           app.launch()

           // Use recording to get started writing UI tests.
           // Use XCTAssert and related functions to verify your tests produce the correct results.
           
            
           app.buttons["digit2"].tap()
           app.buttons["enter"].tap()
           app.buttons["digit3"].tap()
           app.buttons["multiply"].tap()

           let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
           XCTAssertEqual(labelText, "6.0")
           
       }

    func testDivide6by3equals2() {
             // UI tests must launch the application that they test.
             let app = XCUIApplication()
             app.launch()

             // Use recording to get started writing UI tests.
             // Use XCTAssert and related functions to verify your tests produce the correct results.
             
              
             app.buttons["digit6"].tap()
             app.buttons["enter"].tap()
             app.buttons["digit3"].tap()
             app.buttons["divide"].tap()

             let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
             XCTAssertEqual(labelText, "2.0")
             
         }
    
    func testClear() {
             // UI tests must launch the application that they test.
             let app = XCUIApplication()
             app.launch()

             // Use recording to get started writing UI tests.
             // Use XCTAssert and related functions to verify your tests produce the correct results.
             
              
             app.buttons["digit6"].tap()
             app.buttons["enter"].tap()
             app.buttons["digit3"].tap()
             app.buttons["clear"].tap()

             let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
             XCTAssertEqual(labelText, "")
             
         }
   
    /*
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
 */
}
