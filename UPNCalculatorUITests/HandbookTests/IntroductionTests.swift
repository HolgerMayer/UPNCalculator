//
//  IntroductionTests.swift
//  UPNCalculatorUITests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class IntroductionTests: XCTestCase {

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

    func testPage13() {
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)

        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit6"].tap()
        app.buttons["subtract"].tap()
        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,3)
        
        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit6"].tap()
        app.buttons["multiply"].tap()
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,54)
        
        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit6"].tap()
        app.buttons["divide"].tap()
        
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,1.5)
        
        app.buttons["digit9"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit6"].tap()
        app.buttons["xovery"].tap()
             
        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertEqual(result!,531441)
             
    }
    
    func testPage14() {
        let app = XCUIApplication()
        app.launch()
        let testTool = TestTool(app: app)

        app.buttons["digit3"].tap()
        app.buttons["digit0"].tap()
        app.buttons["digit0"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit5"].tap()
        app.buttons["digit1"].tap()
        app.buttons["enter"].tap()
        app.buttons["digit2"].tap()
        app.buttons["multiply"].tap()
         
        var result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! == 601.0200)

        app.buttons["digit9"].tap()
        app.buttons["dot"].tap()
        app.buttons["digit8"].tap()
        app.buttons["digit1"].tap()
        app.buttons["divide"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 61.3286 <= 0.0001)

        app.buttons["sqrt"].tap()

        result = testTool.getValueFromDisplay()
        XCTAssertNotNil(result)
        XCTAssertTrue(result! - 7.8313 <= 0.0001)

    }

}
