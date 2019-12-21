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

        app.buttons["gkey"].tap()
        app.buttons["enter"].tap() // LstX
        app.buttons["chs"].tap()
        app.buttons["gkey"].tap()
        app.buttons["sto"].tap() // INT

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! + 123 <= 0.0001)

        app.buttons["gkey"].tap()
        app.buttons["enter"].tap() // LstX
        app.buttons["fkey"].tap()
        app.buttons["sto"].tap() // INT
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! + 0.4567 <= 0.0001," Result should be 0.4567 is \(result!)")

        
    }
}
