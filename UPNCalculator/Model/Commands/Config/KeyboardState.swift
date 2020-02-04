//
//  KeyboardState.swift
//  UPNCalculator
//
//  Created by holgermayer on 11.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation


public enum KeyboardState : String {
    case Default =  "DefaultState"
    case FState = "f"
    case GState = "g"
    case Fix = "fix"
    case Scientific = "scientific"
    case Engineering = "engineering"
    case EEX1 = "eex1"
    case HYPERBOLIC = "hyp"
    case INVHYPERBOLIC = "invhyp"
    case StoreRecall = "storcl"
    case Register1 = "reg1"
    case Register2 = "reg2"
}
