//
//  ViewController.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var outputLabel : UILabel!
    
    @IBOutlet var digit0Button : UIButton!
    @IBOutlet var digit1Button : UIButton!
    @IBOutlet var digit2Button : UIButton!
    @IBOutlet var digit3Button : UIButton!
    @IBOutlet var digit4Button : UIButton!
    @IBOutlet var digit5Button : UIButton!
    @IBOutlet var digit6Button : UIButton!
    @IBOutlet var digit7Button : UIButton!
    @IBOutlet var digit8Button : UIButton!
    @IBOutlet var digit9Button : UIButton!
    @IBOutlet var addButton : UIButton!
    @IBOutlet var subtractButton : UIButton!
    @IBOutlet var multiplyButton : UIButton!
    @IBOutlet var divideButton : UIButton!
    @IBOutlet var sqrtButton : UIButton!
    @IBOutlet var xovereButton : UIButton!
    @IBOutlet var xover10Button : UIButton!
    @IBOutlet var xoveryButton : UIButton!
    @IBOutlet var onedivxButton : UIButton!

    @IBOutlet var sinButton : UIButton!
    @IBOutlet var cosButton : UIButton!
    @IBOutlet var tanButton : UIButton!

    

    
    
    @IBOutlet var dotButton : UIButton!
    @IBOutlet var enterButton : UIButton!
    @IBOutlet var clearButton : UIButton!
    @IBOutlet var chsButton : UIButton!

    
    var calculatorEngine : UPNEngine! = UPNEngine()
    var outputDisplay : CalculatorOutputDisplay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        outputDisplay = CalculatorOutputDisplay(displayLabel: outputLabel!)
    }

    func isPushed() -> Bool {
        return outputDisplay.isPushed
    }
    
    @IBAction func digitTapped(_ sender: UIButton) {
        let command = DigitDotCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.button(sender.titleLabel!.text!)
        command.execute()
    }
    
    
    @IBAction func addTapped(_ sender : UIButton) {
        let command = AddCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.execute()
    }
    
    @IBAction func subtractTapped(_ sender : UIButton) {
         let command = SubtractCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
         command.execute()

    }
    
    @IBAction func multiplyTapped(_ sender : UIButton) {
        let command = MultiplyCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.execute()
    }
    
    @IBAction func divideTapped(_ sender : UIButton) {
         let command = DivideCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
          command.execute()
    }
    
    @IBAction func dotTapped(_ sender : UIButton) {
        let command = DigitDotCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        
        command.button(sender.titleLabel!.text!)
        command.execute()
    }
    
    @IBAction func enterTapped(_ sender : UIButton) {
        
        let command = EnterCommand(calculatorEngine:calculatorEngine, display: outputDisplay)
        command.execute()
    }
    
    @IBAction func clearTapped(_ sender : UIButton) {
        calculatorEngine.clear()
        outputDisplay.clear()
    }
    
    @IBAction func chsTapped(_ sender : UIButton) {
        outputDisplay.changeSign()
    }
    
    
    @IBAction func sinTapped(_ sender : UIButton) {
         let command = SinusCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.execute()
    }
    
    @IBAction func cosTapped(_ sender : UIButton) {
        let command = CosinusCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.execute()
    }
    
    @IBAction func tanTapped(_ sender : UIButton) {
        let command = TangentCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
        command.execute()
    }

  
    @IBAction func squarerootTapped(_ sender : UIButton) {
          let command = SquareRootCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
          command.execute()
      }

    @IBAction func divideOneByXTapped(_ sender : UIButton) {
           let command = DivideOneByXCommand(calculatorEngine: calculatorEngine, display: outputDisplay)
           command.execute()
       }


}

