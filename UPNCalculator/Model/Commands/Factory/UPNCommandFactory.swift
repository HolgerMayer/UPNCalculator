//
//  UPNCommandFactory.swift
//  UPNCalculator
//
//  Created by holgermayer on 09.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import Foundation





class UPNCommandFactory  {
    
    private var masterCommandDictionary : [String:[String:Command]] = [:]

    private var calculatorEngine : UPNEngine
    private var display : Display
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
        
        setupCommandDictionary()
    }

    
    func createCommand(_ commandKey : CommandKey, _ state : KeyboardState) -> Command? {
        
        guard let dictionary = masterCommandDictionary[state.rawValue] else {
            return nil
        }
        
        return dictionary[commandKey.rawValue]
    }
        
    private func setupCommandDictionary(){
        var defaultCommandDictionary : [String: Command] = [:]
        var fStateCommandDictionary : [String: Command] = [:]
        var gStateCommandDictionary : [String: Command] = [:]
        var fixCommandDictionary : [String: Command] = [:]
        var scientificCommandDictionary : [String: Command] = [:]
        var engeneeringCommandDictionary : [String: Command] = [:]
        var eex1CommandDictionary : [String: Command] = [:]
 
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
        defaultCommandDictionary[CommandKey.eexKey.rawValue] = EEXCommand(calculatorEngine: calculatorEngine, display: display)

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

        
        defaultCommandDictionary[CommandKey.fKey.rawValue] = FCommand(calculatorEngine: calculatorEngine, display: display)
        defaultCommandDictionary[CommandKey.gKey.rawValue] = GCommand(calculatorEngine: calculatorEngine, display: display)
        
        masterCommandDictionary[KeyboardState.Default.rawValue] = defaultCommandDictionary
        
        //###########################
        //###################### FKey
        //###########################

        fStateCommandDictionary[CommandKey.digit7Key.rawValue] = FixCommand(calculatorEngine: calculatorEngine, display: display)
        fStateCommandDictionary[CommandKey.digit8Key.rawValue] = SciCommand(calculatorEngine: calculatorEngine, display: display)
        fStateCommandDictionary[CommandKey.digit9Key.rawValue] = EngCommand(calculatorEngine: calculatorEngine, display: display)

        fStateCommandDictionary[CommandKey.gsbKey.rawValue] = ClearCommand(calculatorEngine: calculatorEngine, display: display)

        // Row 4
        fStateCommandDictionary[CommandKey.stoKey.rawValue] = FracCommand(calculatorEngine: calculatorEngine, display: display)

        masterCommandDictionary[KeyboardState.FState.rawValue] = fStateCommandDictionary

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
        
        masterCommandDictionary[KeyboardState.GState.rawValue] = gStateCommandDictionary

        
        
        fixCommandDictionary[CommandKey.digit0Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"0")
        fixCommandDictionary[CommandKey.digit1Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"1")
        fixCommandDictionary[CommandKey.digit2Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"2")
        fixCommandDictionary[CommandKey.digit3Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"3")
        fixCommandDictionary[CommandKey.digit4Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"4")
        fixCommandDictionary[CommandKey.digit5Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"5")
        fixCommandDictionary[CommandKey.digit6Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"6")
        fixCommandDictionary[CommandKey.digit7Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"7")
        fixCommandDictionary[CommandKey.digit8Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"8")
        fixCommandDictionary[CommandKey.digit9Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"9")
        
        masterCommandDictionary[KeyboardState.Fix.rawValue] = fixCommandDictionary
        
        
        
        scientificCommandDictionary[CommandKey.digit0Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"0")
        scientificCommandDictionary[CommandKey.digit1Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"1")
        scientificCommandDictionary[CommandKey.digit2Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"2")
        scientificCommandDictionary[CommandKey.digit3Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"3")
        scientificCommandDictionary[CommandKey.digit4Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"4")
        scientificCommandDictionary[CommandKey.digit5Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"5")
        scientificCommandDictionary[CommandKey.digit6Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"6")
        scientificCommandDictionary[CommandKey.digit7Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"7")
        scientificCommandDictionary[CommandKey.digit8Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"8")
        scientificCommandDictionary[CommandKey.digit9Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"9")

        
        masterCommandDictionary[KeyboardState.Scientific.rawValue] = scientificCommandDictionary
        
        
        engeneeringCommandDictionary[CommandKey.digit0Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"0")
        engeneeringCommandDictionary[CommandKey.digit1Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"1")
        engeneeringCommandDictionary[CommandKey.digit2Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"2")
        engeneeringCommandDictionary[CommandKey.digit3Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"3")
        engeneeringCommandDictionary[CommandKey.digit4Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"4")
        engeneeringCommandDictionary[CommandKey.digit5Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"5")
        engeneeringCommandDictionary[CommandKey.digit6Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"6")
        engeneeringCommandDictionary[CommandKey.digit7Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"7")
        engeneeringCommandDictionary[CommandKey.digit8Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"8")
        engeneeringCommandDictionary[CommandKey.digit9Key.rawValue] = NumberFormatDigitCommand(calculatorEngine: calculatorEngine, display: display, token:"9")
        
        masterCommandDictionary[KeyboardState.Engineering.rawValue] = engeneeringCommandDictionary
        
        
        
        eex1CommandDictionary[CommandKey.digit0Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"0")
        eex1CommandDictionary[CommandKey.digit1Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"1")
        eex1CommandDictionary[CommandKey.digit2Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"2")
        eex1CommandDictionary[CommandKey.digit3Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"3")
        eex1CommandDictionary[CommandKey.digit4Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"4")
        eex1CommandDictionary[CommandKey.digit5Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"5")
        eex1CommandDictionary[CommandKey.digit6Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"6")
        eex1CommandDictionary[CommandKey.digit7Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"7")
        eex1CommandDictionary[CommandKey.digit8Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"8")
        eex1CommandDictionary[CommandKey.digit9Key.rawValue] = EEX1Command(calculatorEngine: calculatorEngine, display: display, token:"9")
        eex1CommandDictionary[CommandKey.chsKey.rawValue] = EEXChangeSignCommand(calculatorEngine: calculatorEngine, display: display)
        eex1CommandDictionary[CommandKey.backArrowKey.rawValue] = EEXBackArrowCommand(calculatorEngine: calculatorEngine, display: display)

        
        masterCommandDictionary[KeyboardState.EEX1.rawValue] = eex1CommandDictionary
  

    }
}
