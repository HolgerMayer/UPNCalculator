//
//  ViewController.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputLabel : UILabel!
    
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

    var isPushed = true
    var calculatorEngine = UPNEngine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputLabel.text = ""
    }

    @IBAction func digitTapped(_ sender: UIButton) {
        digitOrDotButtonClicked(sender)
    }
    
    
    @IBAction func addTapped(_ sender : UIButton) {
        if !isPushed {
            enterNumberFromInput()
        }
        
        calculatorEngine.add()
        guard let result = calculatorEngine.top else {
            inputLabel.text! = "Error during addition"
            return
        }

        inputLabel.text! = "\(result)"
    }
    
    @IBAction func subtractTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
             calculatorEngine.subtract()
             guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during subtraction"
                 return
             }

             inputLabel.text! = "\(result)"
        }
    
    @IBAction func multiplyTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
             calculatorEngine.multiply()
             guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during multiply"
                 return
             }

             inputLabel.text! = "\(result)"
        }
    
    @IBAction func divideTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
        do {
            try  calculatorEngine.divide()
        } catch {
        inputLabel.text! = "Error during division calculation"
           return

        }
        
        guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during division"
                 return
        }

        inputLabel.text! = "\(result)"
    }
    
    @IBAction func dotTapped(_ sender : UIButton) {
            digitOrDotButtonClicked(sender)

    }
    
    @IBAction func enterTapped(_ sender : UIButton) {
        
        enterNumberFromInput()
    }
    
    @IBAction func clearTapped(_ sender : UIButton) {
        calculatorEngine.clear()
        inputLabel.text! = ""
        isPushed = false
    }
    
    @IBAction func chsTapped(_ sender : UIButton) {
      guard let value = Double(inputLabel.text!) else {
                  inputLabel.text! = "Error wrong number format"
                  return
              }

        inputLabel.text! = "\(-1 * value)"
    }
    
    
    @IBAction func sinTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
        do {
            try  calculatorEngine.sin()
        } catch {
        inputLabel.text! = "Error during sinus calculation"
           return

        }
        
        guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during sinus"
                 return
        }

        inputLabel.text! = "\(result)"
    }
    
    @IBAction func cosTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
        do {
            try  calculatorEngine.cos()
        } catch {
        inputLabel.text! = "Error during cosinus calculation"
           return

        }
        
        guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during cosinus"
                 return
        }

        inputLabel.text! = "\(result)"
    }
    
    @IBAction func tanTapped(_ sender : UIButton) {
            if !isPushed {
                 enterNumberFromInput()
             }
             
        do {
            try  calculatorEngine.tan()
        } catch {
        inputLabel.text! = "Error during tan calculation"
           return

        }
        
        guard let result = calculatorEngine.top else {
                 inputLabel.text! = "Error during tan"
                 return
        }

        inputLabel.text! = "\(result)"
    }

    private func enterNumberFromInput(){
        guard let value = Double(inputLabel.text!) else {
               inputLabel.text! = "Error wrong number format"
               return
           }
           
           calculatorEngine.enterNumber(value)
           isPushed = true
    }
    
    private func digitOrDotButtonClicked(_ button: UIButton){
        let digitString = button.titleLabel?.text
        
        if isPushed {
            inputLabel.text! = digitString!
            isPushed = false
        } else {
            inputLabel.text! += digitString!
        }
        print(inputLabel.text!)
    }
    
    

}

