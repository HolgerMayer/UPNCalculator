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


}
