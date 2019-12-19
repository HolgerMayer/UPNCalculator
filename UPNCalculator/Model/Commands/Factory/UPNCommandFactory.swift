//
//  UPNCommandFactory.swift
//  UPNCalculator
//
//  Created by holgermayer on 09.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation





class UPNCommandFactory  {
    
    private var defaultCommandDictionary : [String: Command] = [:]
    private var fStateCommandDictionary : [String: Command] = [:]
    private var gStateCommandDictionary : [String: Command] = [:]

    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
        
        setupCommandDictionary()
    }

    
    func createCommand(_ commandKey : CommandKey, _ state : KeyboardState) -> Command? {
        switch state {
        case .Default :
            return createDefaultCommand(commandKey)
        case .FState :
            return createFCommand(commandKey)
        case .GState :
            return createGCommand(commandKey)
        }
    }
    
    private func createDefaultCommand(_ commandKey : CommandKey) -> Command? {
        return  defaultCommandDictionary[commandKey.rawValue]
    }
    
    private func createFCommand(_ commandKey : CommandKey) -> Command? {
         return  fStateCommandDictionary[commandKey.rawValue]
    }
    
    private func createGCommand(_ commandKey : CommandKey) -> Command? {
        return  gStateCommandDictionary[commandKey.rawValue]
   }
    
    private func setupCommandDictionary(){
        defaultCommandDictionary[CommandKey.digit0Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"0")
        defaultCommandDictionary[CommandKey.digit1Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"1")
        defaultCommandDictionary[CommandKey.digit2Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"2")
        defaultCommandDictionary[CommandKey.digit3Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"3")
        defaultCommandDictionary[CommandKey.digit4Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"4")
        defaultCommandDictionary[CommandKey.digit5Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"5")
        defaultCommandDictionary[CommandKey.digit6Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"6")
        defaultCommandDictionary[CommandKey.digit7Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"7")
        defaultCommandDictionary[CommandKey.digit8Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"8")
        defaultCommandDictionary[CommandKey.digit9Key.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:"9")
        defaultCommandDictionary[CommandKey.dotKey.rawValue] = DigitDotCommand(calculatorEngine: calculatorEngine, display: display, token:".")

        //
        //
        //
        
        defaultCommandDictionary[CommandKey.addKey.rawValue] = AddCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.subtractKey.rawValue] = SubtractCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.multiplyKey.rawValue] = MultiplyCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.divideKey.rawValue] = DivideCommand(calculatorEngine: calculatorEngine, display: display)

        //
        defaultCommandDictionary[CommandKey.enterKey.rawValue] = EnterCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.chsKey.rawValue] = ChangeSignCommand(calculatorEngine: calculatorEngine, display: display)

        //
        //
        //
        
        defaultCommandDictionary[CommandKey.sinKey.rawValue] = SineCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.cosKey.rawValue] = CosineCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.tanKey.rawValue] = TangentCommand(calculatorEngine: calculatorEngine, display: display)

        
        defaultCommandDictionary[CommandKey.sqrtKey.rawValue] = SquareRootCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.xOverEKey.rawValue] = ExpCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.xOverTenKey.rawValue] = XOverTenCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.xOverYKey.rawValue] = PowCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.divide1ByXKey.rawValue] = DivideOneByXCommand(calculatorEngine: calculatorEngine, display: display)
 
        defaultCommandDictionary[CommandKey.exchangeXYKey.rawValue] = ExchangeXYCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.backArrowKey.rawValue] = BackArrowCommand(calculatorEngine: calculatorEngine, display: display)

        //###########################
        //###################### FKey
        //###########################

        fStateCommandDictionary[CommandKey.gsbKey.rawValue] = ClearCommand(calculatorEngine: calculatorEngine, display: display)

        // Row 4
        fStateCommandDictionary[CommandKey.stoKey.rawValue] = FracCommand(calculatorEngine: calculatorEngine, display: display)

        
        //###########################
        //###################### GKey
        //###########################
        
        // Row 1
         gStateCommandDictionary[CommandKey.sqrtKey.rawValue] = SquareXCommand(calculatorEngine: calculatorEngine, display: display)
         gStateCommandDictionary[CommandKey.xOverEKey.rawValue] = LogCommand(calculatorEngine: calculatorEngine, display: display)
         gStateCommandDictionary[CommandKey.xOverTenKey.rawValue] = Log10Command(calculatorEngine: calculatorEngine, display: display)

        gStateCommandDictionary[CommandKey.chsKey.rawValue] = AbsCommand(calculatorEngine: calculatorEngine, display: display)
        gStateCommandDictionary[CommandKey.eexKey.rawValue] = PiCommand(calculatorEngine: calculatorEngine, display: display)

        
        // Row 2
        
        gStateCommandDictionary[CommandKey.sinKey.rawValue] = ASineCommand(calculatorEngine: calculatorEngine, display: display)
        gStateCommandDictionary[CommandKey.cosKey.rawValue] = ACosineCommand(calculatorEngine: calculatorEngine, display: display)
        gStateCommandDictionary[CommandKey.tanKey.rawValue] = ATangentCommand(calculatorEngine: calculatorEngine, display: display)
        
  

        
        // Row 3
        gStateCommandDictionary[CommandKey.enterKey.rawValue] = LastXCommand(calculatorEngine: calculatorEngine, display: display)
        
        
        // Row 4
        gStateCommandDictionary[CommandKey.stoKey.rawValue] = IntCommand(calculatorEngine: calculatorEngine, display: display)
    }
}
