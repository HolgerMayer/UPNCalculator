//
//  UPNEngineMemoryStackTests.swift
//  UPNCalculatorTests
//
//  Created by holgermayer on 23.01.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import XCTest
@testable import UPNCalculator

class UPNEngineMemoryStackTests: XCTestCase {

    var engine : UPNEngine!
    var display : CalculatorDisplay!
    var mockDelegate : DisplayMockDelegate!

    var digit0Command :DigitDotCommand!
    var digit1Command : DigitDotCommand!
    var digit2Command : DigitDotCommand!
    var digit3Command : DigitDotCommand!
    var digit4Command : DigitDotCommand!
    var digit5Command : DigitDotCommand!
    var digit6Command : DigitDotCommand!
    var digit7Command : DigitDotCommand!
    var digit8Command : DigitDotCommand!
    var digit9Command : DigitDotCommand!
    var dotCommand : DigitDotCommand!
    var enterCommand : EnterCommand!

     override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.
        engine = UPNEngine()
        display = CalculatorDisplay()
        mockDelegate = DisplayMockDelegate()
        display.delegate = mockDelegate
 
        digit0Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "0")
        digit1Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "1")
        digit2Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "2")
        digit3Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "3")
        digit4Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "4")
        digit5Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "5")
        digit6Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "6")
        digit7Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "7")
        digit8Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "8")
        digit9Command = DigitDotCommand(calculatorEngine: engine, display: display, token: "9")
        dotCommand = DigitDotCommand(calculatorEngine: engine, display: display, token: ".")
        enterCommand = EnterCommand(calculatorEngine: engine, display: display)

    }

     override func tearDown() {
         // Put teardown code here. This method is called after the invocation of each test method in the class.
     }

       
    func testStackLift() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)
        
        let piCommand = PiCommand(calculatorEngine: engine, display: display)
        
        let _ = piCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),Double.pi)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),2)
    }
       
    func testNoStackLiftOrDrop() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)

        let squareRootCommand = SquareRootCommand(calculatorEngine: engine, display: display)
        
        let _ = squareRootCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
    }

    func testStackDrop() {
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)

        let addCommand = AddCommand(calculatorEngine: engine, display: display)
            
        let _ = addCommand.execute()
            
        XCTAssertEqual(engine.peek(register:.X),7)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),1)
    }
    
    func testStackEnterBehaviour() {
       
  
        engine.enterNumber(6)
        engine.enterNumber(7)
        engine.enterNumber(8)
        engine.enterNumber(9)

        display.isPushed = true
        display.needsOverride = false

        let _ = digit1Command.execute()
  
        XCTAssertEqual(engine.peek(register:.X),1)
        XCTAssertEqual(engine.peek(register:.Y),9)
        XCTAssertEqual(engine.peek(register:.Z),8)
        XCTAssertEqual(engine.peek(register:.T),7)

        
        let _ = enterCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),1)
        XCTAssertEqual(engine.peek(register:.Y),1)
        XCTAssertEqual(engine.peek(register:.Z),9)
        XCTAssertEqual(engine.peek(register:.T),8)

        let _ = digit2Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),1)
        XCTAssertEqual(engine.peek(register:.Z),9)
        XCTAssertEqual(engine.peek(register:.T),8)

        let _ = enterCommand.execute()
         
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),9)

        let _ = digit3Command.execute()

         
        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),1)
        XCTAssertEqual(engine.peek(register:.T),9)
 
        let _ = enterCommand.execute()

        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
        
        let _ = digit4Command.execute()

        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
     }

    func testRollUpRollDownExchange(){
        let rollUpCommand = RollUpCommand(calculatorEngine: engine, display: display)
        let rollDownCommand = RollDownCommand(calculatorEngine: engine, display: display)
        let exchangeCommand = ExchangeXYCommand(calculatorEngine: engine, display: display)
        
        engine.enterNumber(1)
        engine.enterNumber(2)
        engine.enterNumber(3)
        engine.enterNumber(4)
        
        display.isPushed = true
        display.needsOverride = false

        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)

        let resultDown = rollDownCommand.execute()
        
        XCTAssertEqual(resultDown,.Default)
        XCTAssertEqual(engine.peek(register:.X)!,3)
        XCTAssertEqual(engine.peek(register:.Y)!,2)
        XCTAssertEqual(engine.peek(register:.Z)!,1)
        XCTAssertEqual(engine.peek(register:.T)!,4)
   
        let resultUp = rollUpCommand.execute()
          
        XCTAssertEqual(resultUp,.Default)
        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)

        let resultExchange = exchangeCommand.execute()
          
        XCTAssertEqual(resultExchange,.Default)
        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
   }
    
    func testLastXRegister(){
        display.isPushed = true
        display.needsOverride = false

        let _ = digit2Command.execute()
        let _ = digit8Command.execute()
        let _ = digit7Command.execute()
        let _ = enterCommand.execute()
        
        let _ = digit1Command.execute()
        let _ = digit2Command.execute()
        let _ = dotCommand.execute()
        let _ = digit9Command.execute()
        
        let divideCommand = DivideCommand(calculatorEngine: engine, display: display)
        let _ = divideCommand.execute()
        
        let lastXCommand = LastXCommand(calculatorEngine: engine, display: display)
        let result = lastXCommand.execute()
        
        XCTAssertEqual(result,.Default)
        
        let multiplyCommand = MultiplyCommand(calculatorEngine: engine, display: display)
        let _ = multiplyCommand.execute()
        
        let _ = digit1Command.execute()
        let _ = digit3Command.execute()
        let _ = dotCommand.execute()
        let _ = digit9Command.execute()
        
        let _ = divideCommand.execute()
        
        guard let value = display.value else {
            XCTFail()
            return
        }
         
        XCTAssertTrue(abs(value - 20.6475) < 0.0001)
        
        guard let topValue = engine.top else {
            XCTFail()
            return
        }
        
        XCTAssertTrue(abs(topValue - 20.6475) < 0.0001)
        
    }
    
    func testCalculatorFunctions_1() {
        display.isPushed = true
        display.needsOverride = false

        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)

        let sqrtCommand = SquareRootCommand(calculatorEngine: engine, display: display)
        let _ = sqrtCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),2)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)

        let _ = digit5Command.execute()

        XCTAssertEqual(engine.peek(register:.X),5)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),2)

        let addCommand = AddCommand(calculatorEngine: engine, display: display)
        let _ = addCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),7)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),2)


        let clxCommand = CLxCommand(calculatorEngine: engine, display: display)
        let _ = clxCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),0)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),2)

        let _ = digit6Command.execute()

        XCTAssertEqual(engine.peek(register:.X),6)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),2)

        let xoveryCommand = PowCommand(calculatorEngine: engine, display: display)
        let _ = xoveryCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),729)
        XCTAssertEqual(engine.peek(register:.Y),2)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),2)

      }
      
    func testOderEntryAndTheENterKey(){
         display.isPushed = true
         display.needsOverride = false

         let _ = digit1Command.execute()
         let _ = enterCommand.execute()
         let _ = digit2Command.execute()
         let _ = enterCommand.execute()
         let _ = digit3Command.execute()
         let _ = enterCommand.execute()
         let _ = digit4Command.execute()
        
         XCTAssertEqual(engine.peek(register:.X),4)
         XCTAssertEqual(engine.peek(register:.Y),3)
         XCTAssertEqual(engine.peek(register:.Z),2)
         XCTAssertEqual(engine.peek(register:.T),1)
        
         display.isPushed = true
         display.needsOverride = false

        let _ = digit9Command.execute()
        let _ = digit8Command.execute()

        XCTAssertEqual(engine.peek(register:.X),98)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),2)

        let _ = enterCommand.execute()
   
        XCTAssertEqual(engine.peek(register:.X),98)
        XCTAssertEqual(engine.peek(register:.Y),98)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)
        
        let _ = digit1Command.execute()
        let _ = digit5Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),15)
        XCTAssertEqual(engine.peek(register:.Y),98)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let subtractCommand = SubtractCommand(calculatorEngine: engine, display: display)
        let _ = subtractCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),83)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

    }
    
    func testNestedCalculations(){
        display.isPushed = true
        display.needsOverride = false

        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
           
        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
           
        display.isPushed = true
        display.needsOverride = false

        let _ = digit6Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),6)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),2)

        let _ = enterCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),6)
        XCTAssertEqual(engine.peek(register:.Y),6)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = digit7Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),7)
        XCTAssertEqual(engine.peek(register:.Y),6)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let addCommand = AddCommand(calculatorEngine: engine, display: display)
        let _ = addCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),13)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = digit5Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),5)
        XCTAssertEqual(engine.peek(register:.Y),13)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let multiplyCommand = MultiplyCommand(calculatorEngine: engine, display: display)
        let _ = multiplyCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),65)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = digit4Command.execute()

        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),65)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = addCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),69)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = digit3Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),3)
        XCTAssertEqual(engine.peek(register:.Y),69)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = multiplyCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),207)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

    }
    
    func testCalculationsWithConstants(){
        
        display.isPushed = true
        display.needsOverride = false

         
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
            
        display.isPushed = true
        display.needsOverride = false
        
        let _ = digit4Command.execute()
        let _ = dotCommand.execute()
        let _ = digit3Command.execute()
        
        let _ = enterCommand.execute()
        
        XCTAssertEqual(engine.peek(register:.X),4.3)
        XCTAssertEqual(engine.peek(register:.Y),4.3)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)
        
        let _ = digit9Command.execute()
        let _ = dotCommand.execute()
        let _ = digit5Command.execute()
        
        let eexCommand = EEXCommand(calculatorEngine: engine, display: display)
        let _ = eexCommand.execute()
        
        let eexDigit1Command = EEX1Command(calculatorEngine: engine, display: display, token: "1")
        let eexDigit5Command = EEX1Command(calculatorEngine: engine, display: display, token: "5")

        let _ = eexDigit1Command.execute()
        let _ = eexDigit5Command.execute()
        
        XCTAssertEqual(engine.peek(register:.X),9.5 * Darwin.pow(10, 15))
        XCTAssertEqual(engine.peek(register:.Y),4.3)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),3)
         
        let multiplyCommand = MultiplyCommand(calculatorEngine: engine, display: display)
        let _ = multiplyCommand.execute()
        
        XCTAssertEqual(display.lastX,9.5 * Darwin.pow(10, 15))
        XCTAssertTrue(Darwin.log10(engine.peek(register:.X)!)-16 < 1)
        XCTAssertEqual(engine.peek(register:.X)! / Darwin.pow(10, 16), 4.1, accuracy:0.1)
        XCTAssertEqual(engine.peek(register:.Y),4)
        XCTAssertEqual(engine.peek(register:.Z),3)
        XCTAssertEqual(engine.peek(register:.T),3)

        let _ = digit8Command.execute()
        let _ = dotCommand.execute()
        let _ = digit7Command.execute()
        
        let lastXCommand = LastXCommand(calculatorEngine: engine, display: display)
        let _ = lastXCommand.execute()
        
        XCTAssertEqual(display.lastX,9.5 * Darwin.pow(10, 15))
        XCTAssertEqual(engine.peek(register:.X),9.5 * Darwin.pow(10, 15))
        XCTAssertEqual(engine.peek(register:.Y),8.7)
        XCTAssertTrue(Darwin.log10(engine.peek(register:.Z)!)-16 < 1)
        XCTAssertEqual(engine.peek(register:.Z)! / Darwin.pow(10, 16), 4.1, accuracy:0.1)
        XCTAssertEqual(engine.peek(register:.T),4)

        let _ = multiplyCommand.execute()
        
        XCTAssertEqual(display.lastX,9.5 * Darwin.pow(10, 15))
        XCTAssertTrue(Darwin.log10(engine.peek(register:.X)!)-16 < 1)
        XCTAssertEqual(engine.peek(register:.X)! / Darwin.pow(10, 16), 8.3, accuracy:0.1)
        XCTAssertTrue(Darwin.log10(engine.peek(register:.Y)!)-16 < 1)
        XCTAssertEqual(engine.peek(register:.Y)! / Darwin.pow(10, 16), 4.1, accuracy:0.1)
        XCTAssertEqual(engine.peek(register:.Z),4)
        XCTAssertEqual(engine.peek(register:.T),4)

    }
    
    func testMultipleConstants(){
        display.isPushed = true
        display.needsOverride = false

                
        let _ = digit1Command.execute()
        let _ = enterCommand.execute()
        let _ = digit2Command.execute()
        let _ = enterCommand.execute()
        let _ = digit3Command.execute()
        let _ = enterCommand.execute()
        let _ = digit4Command.execute()
               
        XCTAssertEqual(engine.peek(register:.X),4)
        XCTAssertEqual(engine.peek(register:.Y),3)
        XCTAssertEqual(engine.peek(register:.Z),2)
        XCTAssertEqual(engine.peek(register:.T),1)
            
        display.isPushed = true
        display.needsOverride = false
     
        let _ = digit1Command.execute()
        let _ = dotCommand.execute()
        let _ = digit1Command.execute()
        let _ = digit5Command.execute()

        let _ = enterCommand.execute()
        let _ = enterCommand.execute()
        let _ = enterCommand.execute()

        XCTAssertEqual(engine.peek(register:.X),1.15)
        XCTAssertEqual(engine.peek(register:.Y),1.15)
        XCTAssertEqual(engine.peek(register:.Z),1.15)
        XCTAssertEqual(engine.peek(register:.T),1.15)

        let _ = digit1Command.execute()
        let _ = digit0Command.execute()
        let _ = digit0Command.execute()
        let _ = digit0Command.execute()

        let multiplyCommand = MultiplyCommand(calculatorEngine: engine, display: display)
        
        let _ = multiplyCommand.execute()
        XCTAssertEqual(engine.peek(register:.X),1150)

        let _ = multiplyCommand.execute()
        XCTAssertEqual(engine.peek(register:.X),1322.5)

        let _ = multiplyCommand.execute()
        XCTAssertEqual(engine.peek(register:.X)!,1520.8750, accuracy : 0.0001)

        let _ = multiplyCommand.execute()
        XCTAssertEqual(engine.peek(register:.X)!,1749.0063, accuracy : 0.0001)

    }
}

