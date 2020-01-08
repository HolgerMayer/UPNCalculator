//
//  DisplayMockDelegate.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 04.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation
@testable import UPNCalculator

class DisplayMockDelegate : DisplayDelegate
{
    
     var delegate_didCall_didChangeDisplay  : Bool = false
     var delegate_didCall_didChangeDisplayToError : Bool = false
     var delegate_didCall_didClearError : Bool = false
     var delegate_didCall_didChangeState : Bool = false
     var delegate_didCall_didChangeTrigonometricMode : Bool = false
     var delegate_param1 : String = ""
     var delegate_param_State : KeyboardState?
     var delegate_param_Mode : TrigonometricMode?

    func resetDelegate() {
        
        delegate_didCall_didChangeDisplay = false
        delegate_didCall_didChangeDisplayToError = false
        delegate_didCall_didClearError  = false
        delegate_didCall_didChangeState  = false
        delegate_didCall_didChangeTrigonometricMode = false
        delegate_param1 = ""
        delegate_param_State = nil
        delegate_param_Mode = nil
    }
    
      func didChangeDisplayToError(value: String) {
             delegate_didCall_didChangeDisplayToError = true
             delegate_param1 = value
      }
         
      
      func didClearError() {
             delegate_didCall_didClearError = true
      }
         

    func didChangeDisplay(value: String) {
        delegate_didCall_didChangeDisplay = true
        delegate_param1 = value
    }
    

   func didChangeState(_ state: KeyboardState) {
        delegate_didCall_didChangeState = true
        delegate_param_State = state
   }
    
    func didChangeTrigonometricMode(_ mode: TrigonometricMode) {
        delegate_didCall_didChangeTrigonometricMode = true
        delegate_param_Mode = mode
    }


}
