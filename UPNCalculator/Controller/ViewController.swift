//
//  ViewController.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
      var displayPanel = UIView()
      var outputLabel = UILabel()
      var stateLabel = UILabel()
     
      var digit0Button : UIButton!
      var digit1Button : UIButton!
      var digit2Button : UIButton!
      var digit3Button : UIButton!
      var digit4Button : UIButton!
      var digit5Button : UIButton!
      var digit6Button : UIButton!
      var digit7Button : UIButton!
      var digit8Button : UIButton!
      var digit9Button : UIButton!
      var addButton : UIButton!
      var subtractButton : UIButton!
      var multiplyButton : UIButton!
      var divideButton : UIButton!
      var sqrtButton : UIButton!
      var xovereButton : UIButton!
      var xover10Button : UIButton!
      var xoveryButton : UIButton!
      var onedivxButton : UIButton!

      var sinButton : UIButton!
      var cosButton : UIButton!
      var tanButton : UIButton!

    
      var dotButton : UIButton!
      var enterButton : UIButton!
      var eexButton : UIButton!
      var gsbButton : UIButton!
      var chsButton : UIButton!

    
      var noop1Button : UIButton!
      var noop2Button : UIButton!
      var noop3Button : UIButton!
      var noop5Button : UIButton!
      var xExYButton : UIButton!
      var backArrowButton : UIButton!
      var stoButton : UIButton!
      var rclButton : UIButton!
      var noop10Button : UIButton!

      var onButton : UIButton!
      var fButton : UIButton!
      var gButton : UIButton!
    
    var calculatorEngine : UPNEngine! = UPNEngine()
    var display : CalculatorDisplay!
    var commandFactory : UPNCommandFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createDisplay()
        
        createViewControllerButtons()
        
        createAutolayoutConstraints()
        
        
        display = CalculatorDisplay()
        display.delegate = self
        display.clear()
         
        commandFactory = UPNCommandFactory(calculatorEngine: calculatorEngine, display: display)
         
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        


    }

    func isPushed() -> Bool {
        return display.isPushed
    }
    
    
    @IBAction func buttonTapped(_ sender : UIButton){
        
        guard let keyString = sender.accessibilityLabel else {
            display.state = .Default
            return
        }
        
        guard let commandKey = CommandKey(rawValue:keyString) else {
            display.state = .Default
            return
        }
        
        guard let command = commandFactory.createCommand(commandKey, display.state) else {
            display.state = .Default
            return
        }
        
        command.execute()
        
        display.state = .Default
    }
    
    @IBAction func fButtonTapped(_ sender : UIButton){
        if display.state != .FState {
            display.state = .FState
        } else {
            display.state = .Default
        }
    }

    @IBAction func gButtonTapped(_ sender : UIButton){
        if display.state != .GState {
            display.state = .GState
        } else {
            display.state = .Default
        }
    }

    private func createDisplay(){
        view.backgroundColor = .white
        
        displayPanel.backgroundColor = .lightGray
        displayPanel.layer.cornerRadius = 20.0
        displayPanel.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(displayPanel)
        
        outputLabel.textAlignment = .right
        outputLabel.backgroundColor = .lightGray
        outputLabel.font = .systemFont(ofSize: 25.0)
        outputLabel.text = ""
        outputLabel.translatesAutoresizingMaskIntoConstraints = false
        outputLabel.accessibilityIdentifier = "display"
        displayPanel.addSubview(outputLabel)
        
       
        stateLabel.textAlignment = .left
        stateLabel.backgroundColor = .lightGray
        stateLabel.font = .boldSystemFont(ofSize: 18.0)
        stateLabel.text = ""
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.accessibilityIdentifier = "stateDisplay"
        
        displayPanel.addSubview(stateLabel)
        
         
    }
    
    private func createViewControllerButtons() {
        // First row
        
        sqrtButton = createButton(title1:"A",title2: "sqrt", title3:"X2", accessoryLabel: "sqrt")
        view.addSubview(sqrtButton)

        xovereButton = createButton(title1:"B",title2: "eX", title3:"LN", accessoryLabel: "xovere")
        view.addSubview(xovereButton)

        xover10Button  = createButton(title1:"C",title2: "10X",title3:"LOG", accessoryLabel: "xoverten")
        view.addSubview(xover10Button)

        xoveryButton  = createButton(title1:"D",title2: "yX", title3:"", accessoryLabel: "xovery")
        view.addSubview(xoveryButton)

        onedivxButton  = createButton(title1:"E",title2: "1/x",  title3:"", accessoryLabel: "divide1byx")
        view.addSubview(onedivxButton)

        chsButton = createButton(title1:"",title2: "chs",  title3:"Abs", accessoryLabel: "chs")
        view.addSubview(chsButton)
        
        digit7Button = createButton(title1:"FIX",title2: "7",  title3:"", accessoryLabel: "digit7")
        view.addSubview(digit7Button)

        digit8Button = createButton(title1:"SCI",title2: "8",  title3:"", accessoryLabel: "digit8")
        view.addSubview(digit8Button)

        digit9Button = createButton(title1:"ENG",title2: "9",  title3:"", accessoryLabel: "digit9")
        view.addSubview(digit9Button)

        addButton = createButton(title1:"",title2: "+",  title3:"", accessoryLabel: "add")
        view.addSubview(addButton)


        // Second Row
        
        noop1Button = createButton(title1:"",title2: "Noop", title3:"",  accessoryLabel: "noop1")
        view.addSubview(noop1Button)

        noop2Button = createButton(title1:"",title2: "Noop", title3:"",  accessoryLabel: "noop2")
        view.addSubview(noop2Button)

        sinButton  = createButton(title1:"",title2: "sin",  title3:"sin-1", accessoryLabel: "sin")
        view.addSubview(sinButton)

        cosButton  = createButton(title1:"",title2: "cos",  title3:"cos-1", accessoryLabel: "cos")
        view.addSubview(cosButton)

        tanButton  = createButton(title1:"",title2: "tan",  title3:"tan-1", accessoryLabel: "tan")
        view.addSubview(tanButton)

            
        eexButton = createButton(title1:"",title2: "EEX",  title3:"π", accessoryLabel: "eex")
         view.addSubview(eexButton)

        digit4Button = createButton(title1:"",title2: "4",  title3:"", accessoryLabel: "digit4")
        view.addSubview(digit4Button)

        digit5Button = createButton(title1:"",title2: "5",  title3:"", accessoryLabel: "digit5")
        view.addSubview(digit5Button)

        digit6Button = createButton(title1:"",title2: "6",  title3:"", accessoryLabel: "digit6")
        view.addSubview(digit6Button)

        subtractButton = createButton(title1:"",title2: "-", title3:"",  accessoryLabel: "subtract")
        view.addSubview(subtractButton)


        // Third Row
        
        noop3Button = createButton(title1:"",title2: "Noop",  title3:"", accessoryLabel: "noop3")
        view.addSubview(noop3Button)

        gsbButton = createButton(title1:"Clear ∑",title2: "GSB",  title3:"", accessoryLabel: "gsb")
        view.addSubview(gsbButton)

        noop5Button = createButton(title1:"",title2: "Noop",  title3:"", accessoryLabel: "noop5")
        view.addSubview(noop5Button)

        xExYButton = createButton(title1:"",title2: "X<>Y",  title3:"", accessoryLabel: "exchangexy")
        view.addSubview(xExYButton)

        backArrowButton = createButton(title1:"",title2: "<-",  title3:"", accessoryLabel: "backarrow")
        view.addSubview(backArrowButton)

        enterButton  = createButton(title1:"",title2: "Enter",  title3:"LST X", accessoryLabel: "enter")
        view.addSubview(enterButton)

        digit1Button = createButton(title1:"",title2: "1",  title3:"", accessoryLabel: "digit1")
        view.addSubview(digit1Button)

        digit2Button = createButton(title1:"",title2: "2",  title3:"", accessoryLabel: "digit2")
        view.addSubview(digit2Button)

        digit3Button = createButton(title1:"",title2: "3",  title3:"", accessoryLabel: "digit3")
        view.addSubview(digit3Button)

        multiplyButton = createButton(title1:"",title2: "*",  title3:"", accessoryLabel: "multiply")
        view.addSubview(multiplyButton)


        // Fourth Row

        onButton = createButton(title1:"",title2: "on",  title3:"", accessoryLabel: "noop3")
        onButton.backgroundColor = UIColor.lightGray
        view.addSubview(onButton)

        fButton = createFButton()
        view.addSubview(fButton)

        gButton = createGButton()
        view.addSubview(gButton)

        stoButton = createButton(title1:"FRAC",title2: "STO",  title3:"INT", accessoryLabel: "sto")
        view.addSubview(stoButton)

        rclButton = createButton(title1:"",title2: "RCL",  title3:"", accessoryLabel: "rcl")
        view.addSubview(rclButton)
            
        digit0Button = createButton(title1:"",title2: "0",  title3:"", accessoryLabel: "digit0")
        view.addSubview(digit0Button)

        dotButton = createButton(title1:"",title2: ".",  title3:"", accessoryLabel: "dot")
        view.addSubview(dotButton)

        noop10Button = createButton(title1:"",title2: "Noop", title3:"",  accessoryLabel: "noop10")
        view.addSubview(noop10Button)

        divideButton = createButton(title1:"",title2: "/",  title3:"", accessoryLabel: "divide")
        view.addSubview(divideButton)

}
    

    private func createButton( title1 : String, title2 : String, title3: String, accessoryLabel : String) -> UIButton  {
        
        
            let attributedTitle1 = NSMutableAttributedString(string:title1 + "\n")
            attributedTitle1.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSMakeRange(0, attributedTitle1.length))
            attributedTitle1.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, attributedTitle1.length))

            let attributedTitle2 = NSMutableAttributedString(string:title2 + "\n")
            attributedTitle2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSMakeRange(0, attributedTitle2.length))
            attributedTitle2.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSMakeRange(0, attributedTitle2.length))
        
            let attributedTitle3 = NSMutableAttributedString(string:title3)
            attributedTitle3.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: NSMakeRange(0, attributedTitle3.length))
            attributedTitle3.addAttribute(NSAttributedString.Key.font, value:UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, attributedTitle3.length))

            let attributedTitle  = NSMutableAttributedString()
            attributedTitle.append(attributedTitle1)
            attributedTitle.append(attributedTitle2)
            attributedTitle.append(attributedTitle3)
         
            let button = UIButton()
            button.titleLabel?.lineBreakMode = .byWordWrapping
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.numberOfLines = 0
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.blue.cgColor
            button.layer.cornerRadius = 15.0
            button.backgroundColor = .white
            
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 25.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            button.accessibilityLabel = accessoryLabel
            return button
      }
    
    private func createFButton() -> UIButton  {
          
              let attributedTitle = NSMutableAttributedString(string:"F")
              attributedTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSMakeRange(0, attributedTitle.length))
              attributedTitle.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSMakeRange(0, attributedTitle.length))
          
              let button = UIButton()
              button.titleLabel?.lineBreakMode = .byWordWrapping
              button.titleLabel?.textAlignment = .center
              button.titleLabel?.numberOfLines = 0
              button.layer.borderWidth = 0.5
              button.layer.borderColor = UIColor.blue.cgColor
              button.layer.cornerRadius = 15.0
              button.backgroundColor = UIColor.orange
              
              button.setAttributedTitle(attributedTitle, for: .normal)
              button.setTitleColor(.black, for: .normal)
              button.titleLabel?.font = .systemFont(ofSize: 25.0)
              button.translatesAutoresizingMaskIntoConstraints = false
              button.addTarget(self, action: #selector(fButtonTapped), for: .touchUpInside)
              button.accessibilityLabel = "fkey"
              return button
        }
    
    private func createGButton() -> UIButton  {
            
                let attributedTitle = NSMutableAttributedString(string:"G")
                attributedTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSMakeRange(0, attributedTitle.length))
                attributedTitle.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSMakeRange(0, attributedTitle.length))
            
                let button = UIButton()
                button.titleLabel?.lineBreakMode = .byWordWrapping
                button.titleLabel?.textAlignment = .center
                button.titleLabel?.numberOfLines = 0
                button.layer.borderWidth = 0.5
                button.layer.borderColor = UIColor.black.cgColor
                button.layer.cornerRadius = 15.0
                button.backgroundColor = UIColor.blue
                
                button.setAttributedTitle(attributedTitle, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = .systemFont(ofSize: 25.0)
                button.translatesAutoresizingMaskIntoConstraints = false
                button.addTarget(self, action: #selector(gButtonTapped), for: .touchUpInside)
                button.accessibilityLabel = "gkey"
                return button
          }
    
    
    private func createAutolayoutConstraints(){
        
        // first set display constraints
        var constraint = NSLayoutConstraint(item: displayPanel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 40.0)
         view.addConstraint(constraint)
         
         constraint = NSLayoutConstraint(item: displayPanel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -40.0)
         view.addConstraint(constraint)
                 
         constraint = NSLayoutConstraint(item: displayPanel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)
                 
         constraint = NSLayoutConstraint(item: displayPanel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 120.0)
         view.addConstraint(constraint)

        
        constraint = NSLayoutConstraint(item: outputLabel, attribute: .leading, relatedBy: .equal, toItem: displayPanel, attribute: .leading, multiplier: 1.0, constant: 40.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: outputLabel, attribute: .trailing, relatedBy: .equal, toItem: displayPanel, attribute: .trailing, multiplier: 1.0, constant: -40.0)
        view.addConstraint(constraint)
                
        constraint = NSLayoutConstraint(item: outputLabel, attribute: .top, relatedBy: .equal, toItem: displayPanel, attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
                
        constraint = NSLayoutConstraint(item: outputLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 80.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .leading, relatedBy: .equal, toItem: displayPanel, attribute: .leading, multiplier: 1.0, constant: 40.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .trailing, relatedBy: .equal, toItem: displayPanel, attribute: .trailing, multiplier: 1.0, constant: -40.0)
        view.addConstraint(constraint)
                
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .top, relatedBy: .equal, toItem: outputLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
                
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 20.0)
        view.addConstraint(constraint)

        // First Row
  
        constraintFirstButtonInRow(sqrtButton!, viewOfPreviousRow: displayPanel, firstRow: true)

        constraintOtherButtonsInRow(xovereButton!,  previousButton: sqrtButton!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(xover10Button!, previousButton: xovereButton!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(xoveryButton!, previousButton: xover10Button!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(onedivxButton!, previousButton: xoveryButton!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(chsButton!, previousButton: onedivxButton!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(digit7Button!, previousButton: chsButton!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(digit8Button!, previousButton: digit7Button!, firstButtoninRow: sqrtButton!)
        constraintOtherButtonsInRow(digit9Button!, previousButton: digit8Button!, firstButtoninRow: sqrtButton!)
        constraintLastButtonsInRow(addButton!, previousButton: digit9Button!, firstButtoninRow: sqrtButton!)

        // Second Row

        constraintFirstButtonInRow(noop1Button!, viewOfPreviousRow: sqrtButton, firstRow: false)

        constraintOtherButtonsInRow(noop2Button!,  previousButton: noop1Button!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(sinButton!, previousButton: noop2Button!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(cosButton!, previousButton: sinButton!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(tanButton!, previousButton: cosButton!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(eexButton!, previousButton: tanButton!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(digit4Button!, previousButton: eexButton!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(digit5Button!, previousButton: digit4Button!, firstButtoninRow: noop1Button!)
        constraintOtherButtonsInRow(digit6Button!, previousButton: digit5Button!, firstButtoninRow: noop1Button!)
        constraintLastButtonsInRow(subtractButton!, previousButton: digit6Button!, firstButtoninRow: noop1Button!)

        // Third Row
         constraintFirstButtonInRow(noop3Button!, viewOfPreviousRow: noop1Button, firstRow: false)

         constraintOtherButtonsInRow(gsbButton!,  previousButton: noop3Button!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(noop5Button!, previousButton: gsbButton!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(xExYButton!, previousButton: noop5Button!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(backArrowButton!, previousButton: xExYButton!, firstButtoninRow: noop3Button!)
         constraintDoubleHeightOtherButtonsInRow(enterButton!, previousButton: backArrowButton!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(digit1Button!, previousButton: enterButton!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(digit2Button!, previousButton: digit1Button!, firstButtoninRow: noop3Button!)
         constraintOtherButtonsInRow(digit3Button!, previousButton: digit2Button!, firstButtoninRow: noop3Button!)
         constraintLastButtonsInRow(multiplyButton!, previousButton: digit3Button!, firstButtoninRow: noop3Button!)
        
        // Fourth Row
        constraintFirstButtonInRow(onButton!, viewOfPreviousRow: noop3Button, firstRow: false)

        constraintOtherButtonsInRow(fButton!,  previousButton: onButton!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(gButton!, previousButton: fButton!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(stoButton!, previousButton: gButton!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(rclButton!, previousButton: stoButton!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(digit0Button!, previousButton: enterButton!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(dotButton!, previousButton: digit0Button!, firstButtoninRow: onButton!)
        constraintOtherButtonsInRow(noop10Button!, previousButton: dotButton!, firstButtoninRow: onButton!)
        constraintLastButtonsInRow(divideButton!, previousButton: noop10Button!, firstButtoninRow: onButton!)
        
        constrainLastRowToBottom()
 
}
    
    private func constraintFirstButtonInRow(_ button : UIButton, viewOfPreviousRow : UIView, firstRow : Bool){
        var constraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 30.0)
         view.addConstraint(constraint)
         constraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: viewOfPreviousRow, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

        if !firstRow {
            let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: sqrtButton, attribute: .width, multiplier: 1.0, constant: 0.0)
            view.addConstraint(widthConstraint)
            let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: sqrtButton, attribute: .height, multiplier: 1.0, constant: 0.0)
            view.addConstraint(heightConstraint)

        }
    }
    
  
    
    private func constraintOtherButtonsInRow(_ button : UIButton, previousButton: UIButton, firstButtoninRow: UIButton) {
        var constraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: previousButton, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: firstButtoninRow, attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: sqrtButton, attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(widthConstraint)
        
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: sqrtButton, attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(heightConstraint)

    }
    
    private func constraintLastButtonsInRow(_ button : UIButton, previousButton: UIButton, firstButtoninRow: UIButton) {
        var constraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: previousButton, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: firstButtoninRow, attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: button, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -30.0)
        view.addConstraint(constraint)
        
        let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: sqrtButton, attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(widthConstraint)
          
        let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: sqrtButton, attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(heightConstraint)

      }
    
    private func constraintDoubleHeightOtherButtonsInRow(_ button : UIButton, previousButton: UIButton, firstButtoninRow: UIButton) {
           var constraint = NSLayoutConstraint(item: button, attribute: .leading, relatedBy: .equal, toItem: previousButton, attribute: .trailing, multiplier: 1.0, constant: 0.0)
           view.addConstraint(constraint)
           constraint = NSLayoutConstraint(item: button, attribute: .top, relatedBy: .equal, toItem: firstButtoninRow, attribute: .top, multiplier: 1.0, constant: 0.0)
           view.addConstraint(constraint)
           let widthConstraint = NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: sqrtButton, attribute: .width, multiplier: 1.0, constant: 0.0)
           view.addConstraint(widthConstraint)
           
           let heightConstraint = NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: sqrtButton, attribute: .height, multiplier: 2.0, constant: 0.0)
           view.addConstraint(heightConstraint)

       }
    
    private func constrainLastRowToBottom(){
         var constraint = NSLayoutConstraint(item: fButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)
         
         constraint = NSLayoutConstraint(item: gButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: stoButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: rclButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: digit0Button!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: dotButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: noop10Button!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

         constraint = NSLayoutConstraint(item: divideButton!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
         view.addConstraint(constraint)

    }
}

    
extension ViewController : DisplayDelegate {
 
    func didChangeDisplay(value: String) {
        outputLabel.text! = value
     }
     
    
    func didChangeState(_ state : KeyboardState) {
        switch state {
        case .Default:
            stateLabel.text! = ""
            break
        case .FState:
            stateLabel.text! = "f"
            break
        case .GState:
            stateLabel.text! = "g"
            break
        }
    
    }
     
}

