//
//  CommandController.swift
//  UPNCalculator
//
//  Created by holgermayer on 02.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import Foundation


class CommandController {
    
    var state : KeyboardState = .Default
    var commandLogginEnabled = false

    private var commandLog = Array<String>()
    private var commandFactory : UPNCommandFactory
    private var calculatorEngine : UPNEngine
    private var display : Display
    private var registerController : RegisterController
    
    var primaryFunctionLabels = [0: "√", 1: "eX", 2: "10X" , 3: "yX", 4: "1/x",
                                 6:"GTO", 7: "SIN" , 8: "COS", 9: "TAN",
                                 11: "GSB", 12: "R⬇︎" , 13: "X↔︎Y", 14: "←",
                                 15: "CP", 16: "f" , 17: "g", 18: "STO", 19:"RCL",
                                 20: "CHS", 21:"7" , 22:"8", 23:"9", 24:"/",
                                 25: "EEX", 26:"4" , 27:"5", 28:"6", 29:"*",
                                 30: "Enter", 31:"1" , 32:"2", 33:"3", 34:"-",
                                 35:"0" , 36:".", 37:"∑+", 38:"+"]
    var secondaryFunctionLabels = [0: "A", 1: "B", 2: "C" , 3: "D", 4: "E",
                                   6: "HYP", 7: "" , 8: "", 9: "",
                                   11:"Clear ∑", 12: "" , 13: "Clear REG", 14: "",
                                   15: "", 16: "" , 17: "", 18: "FRAC", 19:"",
                                 20: "", 21:"FIX" , 22:"SCI", 23:"ENG", 24:"",
                                 25: "", 26:"" , 27:"", 28:"", 29:"",
                                 30: "RAN#", 31:"➡︎R" , 32:"➡︎H.MS", 33:"➡︎RAD", 34:"",
                                 35:"x!" , 36:"ẏ,r", 37:"L.R.", 38:"Py,x"]
    var ternaryFunctionLabels = [0: "x²", 1: "LN", 2: "LOG" , 3: "%", 4: "∆%",
                                  6: "HYP-1", 7: "SIN-1" , 8: "COS-1", 9: "TAN-1",
                                 11: "", 12: "R⬆︎" , 13: "RND", 14: "CLx",
                                 15: "", 16: "" , 17: "", 18: "INT", 19:"",
                                 20: "ABS", 21:"DEG" , 22:"RAD", 23:"GRD", 24:"",
                                 25: "EEX", 26:"4" , 27:"5", 28:"6", 29:"*",
                                 30: "LST X", 31:"➡︎P" , 32:"➡︎H", 33:"➡︎DEG", 34:"",
                                 35:"x̅" , 36:"S", 37:"∑-", 38:"Cy,x"]
    var commandKeys : [Int: CommandKey] = [0: .sqrtKey, 1: .xOverEKey, 2: .xOverTenKey , 3: .xOverYKey, 4: .divide1ByXKey,
                                           6: .gtoKey ,7: .sinKey , 8: .cosKey, 9: .tanKey,
                                           11: .gsbKey ,12: .rollDownKey , 13: .exchangeXYKey, 14: .backArrowKey,
                                           16: .fKey , 17: .gKey, 18: .stoKey, 19:.rclKey,
                                           20: .chsKey, 21:.digit7Key, 22:.digit8Key, 23:.digit9Key, 24:.divideKey,
                                           25: .eexKey, 26:.digit4Key , 27:.digit5Key, 28:.digit6Key, 29:.multiplyKey,
                                           30: .enterKey, 31:.digit1Key , 32:.digit2Key, 33:.digit3Key, 34:.subtractKey,
                                           35:.digit0Key , 36:.dotKey, 37:.sumAddKey, 38:.addKey]


    
    
    init( calculatorEngine: UPNEngine, display : Display, registerController:RegisterController){
        self.calculatorEngine = calculatorEngine
        self.display = display
        self.registerController = registerController
        
        commandFactory = UPNCommandFactory(calculatorEngine: calculatorEngine, display: display, registerController: registerController)
    }

    
    func beginLogging() {
        commandLog.removeAll()
        commandLogginEnabled = true
    }
    
    func endLogging(){
        guard let documentDirectoryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
         let fileUrl = documentDirectoryUrl.appendingPathComponent("Log\(Date()).json")

        // Transform array into data and save it into file
           do {
               let data = try JSONSerialization.data(withJSONObject: commandLog, options: [])
               try data.write(to: fileUrl, options: [])
           } catch {
               print(error)
           }
        commandLogginEnabled = false
    }
    
    func executeCommand(keyString : String){
          
        guard let commandKey = CommandKey(rawValue:keyString) else {
            state = .Default
            return
        }
        
        var command = commandFactory.createCommand(commandKey, state)
        
        if command == nil {
            state = .Default
            command = commandFactory.createCommand(commandKey, state)
        }
            
        if command == nil {
            return
        }
        
        if commandLogginEnabled {
            commandLog.append("#"+keyString)
        }
        
        state = command!.execute()
        display.state = state
    }
    
    
}


extension CommandController {
    
    
    func primaryLabelFor(tag : Int) -> String {
        
        guard let result = primaryFunctionLabels[tag] else {
            return "A\(tag)"
        }
        
        return result
    }
    
    func secondaryLabelFor(tag : Int) -> String {
        guard let result = secondaryFunctionLabels[tag] else {
            return "B\(tag)"
        }
        
        return result
    }
    
    func ternaryLabelFor(tag : Int) -> String {
        guard let result = ternaryFunctionLabels[tag] else {
            return "C\(tag)"
        }
        
        return result
    }
    
    func accessoryLabelFor(tag : Int) -> String {
        return primaryLabelFor(tag:tag)
        
    }
    
    func resolveButton(tag : Int) -> String {
        guard let result = commandKeys[tag] else {
            return "F\(tag)"
        }
        
        return result.rawValue
        
    }
    
}
