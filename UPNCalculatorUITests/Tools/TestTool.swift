//
//  TestTool.swift
//  UPNCalculatorUITests
//
//  Created by holgermayer on 15.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import XCTest

class TestTool {
    
    var app : XCUIApplication
    
    init(app : XCUIApplication) {
        self.app = app
    }
    
    func getValueFromDisplay() -> Double? {
          let labelText = app.staticTexts.element(matching:.any,identifier: "display").label
          
          return Double(labelText)
      }
      
    
}
