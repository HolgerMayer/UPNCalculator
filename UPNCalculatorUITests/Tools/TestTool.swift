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
        
        if labelText.count >= 10 {
            let index = labelText.index(labelText.endIndex, offsetBy: -3)
            let foundString = labelText[index]
            if foundString == " " || foundString == "-" {
            
                let range = labelText.startIndex..<labelText.index(labelText.startIndex, offsetBy: 7)
                let substringBase = labelText[range]
                let exponentRange = labelText.index(labelText.startIndex, offsetBy: 8)..<labelText.endIndex
                let substringExponent = labelText[exponentRange]
            
                let trimmedBase = substringBase.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedExponent = substringExponent.trimmingCharacters(in: .whitespacesAndNewlines)

                let formatter = NumberFormatter()
                formatter.locale = Locale.current
                formatter.numberStyle = .decimal
                let number = formatter.number(from: trimmedBase)
                var base = 0.0
                if number != nil {
                    base = number!.doubleValue
                }

                let exponent = Double(trimmedExponent)
                 
                if  exponent != nil {
                    return base * Darwin.pow(10,exponent!)
                }  else {
                    return base
                }
            }

        }
        
        let trimmedText = labelText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current // USA: Locale(identifier: "en_US")
        formatter.numberStyle = .decimal
        let number = formatter.number(from: trimmedText)
        if number == nil {
            return 0.0
        }
        return number?.doubleValue
      }
      
    func displayString() -> String {
         return app.staticTexts.element(matching:.any,identifier: "display").label
        
    }
    
}
