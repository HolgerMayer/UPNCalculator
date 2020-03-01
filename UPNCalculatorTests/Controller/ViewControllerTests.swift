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
         testObject = storyboard.instantiateInitialViewController() as? ViewController

        testObject.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testButtonsAreAvailable() {
        XCTAssertNotNil(testObject.displayViewController.outputLabel)
    }


    func testInitialState(){
        
        XCTAssertEqual(testObject.displayViewController.outputLabel.text,  "")
        XCTAssertNotNil(testObject.calculatorEngine)
        XCTAssertNotNil(testObject.display)
    }
    
}
