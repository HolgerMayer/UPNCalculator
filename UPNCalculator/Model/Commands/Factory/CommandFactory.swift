//
//  CommandFactory.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


protocol CommandFactory {
       func createCommand(_ commandKey : CommandKey, _ state : KeyboardState) -> Command?
}
