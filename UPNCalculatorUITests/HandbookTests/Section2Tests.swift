//
//  Section2Tests.swift
//  UPNCalculatorUITests
//
//  Created by holgermayer on 19.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class Section2Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

      func testPage24() {
         let app = XCUIApplication()
         app.launch()
         let testTool = TestTool(app: app)
        
        app.buttons["gkey"].tap()
        app.buttons["eex"].tap()

        let result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 3.14159 <= 0.0001)

        
    }

    func testPage25(){
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)
        
        // Line 1
        app.buttons["digit1"].tap()
        app.buttons["digit2"].tap()
        app.buttons["digit3"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit4"].tap()
        app.buttons["digit5"].tap()
        app.buttons["digit6"].tap()
        app.buttons["digit7"].tap()

        app.buttons["gkey"].tap()
        app.buttons["sto"].tap() // INT
        
        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 123 <= 0.0001)

        // Line 2
        app.buttons["gkey"].tap()
        app.buttons["enter"].tap() // LstX
        app.buttons["chs"].tap()
        app.buttons["gkey"].tap()
        app.buttons["sto"].tap() // INT

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! + 123 <= 0.0001)

        // Line 3
        
        app.buttons["gkey"].tap()
        app.buttons["enter"].tap() // LstX
        app.buttons["fkey"].tap()
        app.buttons["sto"].tap() // FRAC
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! + 0.4567 <= 0.0001," Result should be 0.4567 is \(result!)")

        // Line 4
        app.buttons["digit1"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit2"].tap()
        app.buttons["digit3"].tap()
        app.buttons["digit4"].tap()
        app.buttons["digit5"].tap()
        app.buttons["digit6"].tap()
        app.buttons["digit7"].tap()
        app.buttons["digit8"].tap()
        app.buttons["digit9"].tap()
        app.buttons["chs"].tap()

        // Line 5
        app.buttons["gkey"].tap()
        app.buttons["exchangexy"].tap() // RND

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! + 1.2346 <= 0.0001," Result should be -1.2346 is \(result!)")

        // Line 6  // TODO: Implement when Clear Prefix is implemented
        
        // Line 7
        // Line 8
        app.buttons["gkey"].tap()
        app.buttons["chs"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 1.2346 <= 0.0001," Result should be 1.2346 is \(result!)")
    }
    
    func testPage29(){
         let app = XCUIApplication()
         app.launch()
         let testTool = TestTool(app: app)
         
         // Line 1
         app.buttons["digit2"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit1"].tap()
         app.buttons["dot"].tap()
         app.buttons["digit4"].tap()
         app.buttons["xovery"].tap()
        
         var result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 2.6390 <= 0.0001," Result should be 2.6390 is \(result!)")

         // Line 2
         app.buttons["digit2"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit1"].tap()
         app.buttons["dot"].tap()
         app.buttons["digit4"].tap()
         app.buttons["chs"].tap()
         app.buttons["xovery"].tap()
        
         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 0.3789 <= 0.0001," Result should be 0.3789 is \(result!)")

         // Line 3
         app.buttons["digit2"].tap()
         app.buttons["chs"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit3"].tap()
         app.buttons["xovery"].tap()
        
         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! + 8.0000 <= 0.0001," Result should be -8.000 is \(result!)")

         // Line 4
         app.buttons["digit2"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit3"].tap()
         app.buttons["divide1byx"].tap()
         app.buttons["xovery"].tap()
        
         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 1.2599 <= 0.0001," Result should be 1.2599 is \(result!)")

    }
    
    func testPage31() {
         let app = XCUIApplication()
         app.launch()
         let testTool = TestTool(app: app)
         

         app.buttons["gkey"].tap()
         app.buttons["digit7"].tap() // Deg
         app.buttons["digit5"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit1"].tap()
         app.buttons["digit0"].tap()
         app.buttons["gkey"].tap()
         app.buttons["digit1"].tap() // ->P
        
         var result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 11.1803 <= 0.0001," Result should be 11.1803 is \(result!)")

         app.buttons["exchangexy"].tap() // ->P

         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 26.5651 <= 0.0001," Result should be 26.5651   \(result!)")

         app.buttons["digit3"].tap()
         app.buttons["digit0"].tap()
         app.buttons["enter"].tap()
         app.buttons["digit1"].tap()
         app.buttons["digit2"].tap()
         app.buttons["fkey"].tap()
         app.buttons["digit1"].tap() // ->R
         
         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 10.3923 <= 0.0001," Result should be 10.3923   \(result!)")

         app.buttons["exchangexy"].tap() // ->P

         result = testTool.getValueFromDisplay()
         XCTAssertNotNil(result)
         XCTAssertTrue(result! - 6.0 <= 0.0001," Result should be 6.0   \(result!)")

    }
}

