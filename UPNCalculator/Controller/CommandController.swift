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
    
    init( calculatorEngine: UPNEngine, display : Display){
        self.calculatorEngine = calculatorEngine
        self.display = display
        
        commandFactory = UPNCommandFactory(calculatorEngine: calculatorEngine, display: display)
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
