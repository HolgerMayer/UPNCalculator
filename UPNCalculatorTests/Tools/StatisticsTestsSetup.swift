//
//  StatisticsTestsSetup.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 11.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation

@testable import UPNCalculator
class StatisticsTestsSetup {
    
    func setupFarmerStatistic( engine: UPNEngine, display : Display, registerController : RegisterController){
        let digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        let digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        let digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        let digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        let digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        let digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        let digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
        let digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        let digit8Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "8")
        let dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        let enterCommand = EnterCommand(calculatorEngine: engine, display: display)
        let sumAddCommand = SumAddCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let clearRegCommand = ClearRegCommand(calculatorEngine: engine, display: display, registerController: registerController)
        
        let _ = clearRegCommand.execute()
        
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit0Command.execute()
           
        let _ = sumAddCommand.execute()
           
        let _ = digit5Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit6Command.execute()
        let _ = dotCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit7Command.execute()
        let _ = dotCommand.execute()
        let _ = digit2Command.execute()
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit6Command.execute()
        let _ = digit0Command.execute()

        let _ = sumAddCommand.execute()

        let _ = digit7Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        let _ = digit8Command.execute()
        let _ = enterCommand.execute()
        let _ = digit8Command.execute()
        let _ = digit0Command.execute()
        
        let _ = sumAddCommand.execute()
    }
}
