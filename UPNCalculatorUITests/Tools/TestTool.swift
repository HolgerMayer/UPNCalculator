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
            let index = labelText.index(labelText.startIndex, offsetBy: 8)
            let foundString = labelText[index]
            if foundString == " " || foundString == "-" {
            
                let range = labelText.startIndex..<labelText.index(labelText.startIndex, offsetBy: 7)
                let substringBase = labelText[range]
                let exponentRange = labelText.index(labelText.startIndex, offsetBy: 8)..<labelText.endIndex
                let substringExponent = labelText[exponentRange]
            
                var trimmedBase = substringBase.trimmingCharacters(in: .whitespacesAndNewlines)
                let trimmedExponent = substringExponent.trimmingCharacters(in: .whitespacesAndNewlines)

                let locale = NSLocale.autoupdatingCurrent
                
                if trimmedBase.contains(locale.decimalSeparator!){
                    trimmedBase = trimmedBase.replacingOccurrences(of: locale.decimalSeparator!, with: locale.groupingSeparator!)
                }
                
                
                let base = Double(trimmedBase)
                let exponent = Double(trimmedExponent)
                
                 
                if base != nil && exponent != nil {
                    return base! * Darwin.pow(10,exponent!)
                } else if base != nil {
                    return base!
                } else {
                    return 0.0
                }
            }

        }
        let trimmedText = labelText.trimmingCharacters(in: .whitespacesAndNewlines)
        return Double(trimmedText)
      }
      
    func displayString() -> String {
         return app.staticTexts.element(matching:.any,identifier: "display").label
        
    }
    
}
