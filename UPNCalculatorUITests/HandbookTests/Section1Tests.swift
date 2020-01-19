//
//  Section1Tests.swift
//  UPNCalculatorUITests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class Section1Tests: XCTestCase {

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
    
    func testPage20(){
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)

        app.buttons["digit6"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit6"].tap()
        app.buttons["digit2"].tap()
        app.buttons["digit6"].tap()
        app.buttons["digit2"].tap()
 
        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6.6262)
        
        app.buttons["eex"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6.6262)
        
        app.buttons["digit3"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6626.2)

        app.buttons["digit4"].tap()
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6.6262 * Darwin.pow(10.0,34))

        app.buttons["chs"].tap()
 
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6.6262 * Darwin.pow(10.0,-34))

        app.buttons["enter"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,6.6262 * Darwin.pow(10.0,-34))

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 6.6262*Darwin.pow(10.0,-34))
              
        app.buttons["digit5"].tap()
        app.buttons["digit0"].tap()
        app.buttons["multiply"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 3.3131*Darwin.pow(10.0,-32))

    }

    func testPage21() {
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)


        app.buttons["digit1"].tap()
        app.buttons["digit2"].tap()
        app.buttons["digit3"].tap()
        app.buttons["digit4"].tap()
        app.buttons["digit5"].tap()
        app.buttons["backarrow"].tap()
        
        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 1234)
        
        app.buttons["digit9"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 12349)
        
        app.buttons["sqrt"].tap()
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 111.1261 <= 0.0001)

        app.buttons["backarrow"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 0)
        
    }

    func testPage22(){
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)

        app.buttons["digit4"].tap()
        app.buttons["digit5"].tap()
        
        app.buttons["gkey"].tap()
        app.buttons["xoverten"].tap()

        let result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 1.6532 <= 0.0001)

    }
    
    func testPage23() {
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)

        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit1"].tap()
        app.buttons["digit7"].tap()
        app.buttons["add"].tap()
        app.buttons["digit4"].tap()
        app.buttons["subtract"].tap()
        app.buttons["digit4"].tap()
        app.buttons["divide"].tap()

        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 5.5 <= 0.0001)

        app.buttons["fkey"].tap()
        app.buttons["gsb"].tap()
        app.buttons["digit6"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit7"].tap()
        app.buttons["add"].tap()
        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit3"].tap()
        app.buttons["subtract"].tap()
        app.buttons["multiply"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 78 <= 0.0001)

    }
}
