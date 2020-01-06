//
//  Command.swift
//  UPNCalculator
//
//  Created by holgermayer on 07.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation

protocol Command {
    
    func execute() -> KeyboardState
}
