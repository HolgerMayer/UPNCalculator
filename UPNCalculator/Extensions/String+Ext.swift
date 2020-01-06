//
//  String+Ext.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


extension String {
    func replaceFirstOccurrence(of string: String, with replacement: String) -> String {
        guard let range = self.range(of: string) else { return self }
         return replacingCharacters(in: range, with: replacement)        
    }
}
