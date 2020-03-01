//
//  ViewController.swift
//  UPNCalculator
//
//  Created by holgermayer on 06.12.19.
//  Copyright © 2019 holgermayer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    var topView: UIView!
    var centerLeftView: UIView!
    var bottomRightView: UIView!
  
    var displayViewController  : CoreDisplayViewController!
    
    private var compactConstraints: [NSLayoutConstraint] = []
    private var regularConstraints: [NSLayoutConstraint] = []
    private var sharedConstraints: [NSLayoutConstraint] = []
    
    var calculatorEngine : UPNEngine! = UPNEngine()
    var registerController : RegisterController! = RegisterController()
    var display : CalculatorDisplay!

    var commandController : CommandController!
    
    
    override func loadView() {
        super.loadView()
        
        display = CalculatorDisplay()
        display.delegate = self
        
        commandController = CommandController(calculatorEngine: calculatorEngine, display: display, registerController: registerController)
        
        createSubviews()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        registerController.delegate = calculatorEngine
   
        // Error : without initialization an enter leads to "" is not a number
        display.value = 0.0
        display.isPushed = true
        display.clear()
        display.trigonometricMode = .deg
        self.view.backgroundColor = .black
         
        
        self.view.setNeedsLayout()

    }
    
 
    
    
}

// #########################################################################################################
//  Setup View
// #########################################################################################################

extension ViewController {
    
    func createSubviews() {
        let topView = UIView(frame: .zero)
        topView.backgroundColor = .green
        topView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(topView)
        self.topView = topView
        
        displayViewController = CoreDisplayViewController()
        
        ViewEmbedder.embed(
            parent: self,
            container: self.topView,
            child:displayViewController,
            previous: nil)
        
        let centerLeftView = UIView(frame: .zero)
        centerLeftView.backgroundColor = .black
        centerLeftView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(centerLeftView)
        self.centerLeftView = centerLeftView
        
        let centerLeftController = CenterLeftButtonViewController()
        centerLeftController.delegate = self
        
        ViewEmbedder.embed(
            parent: self,
            container: self.centerLeftView,
            child:centerLeftController,
            previous: nil)
        
        let bottomRightView = UIView(frame: .zero)
        bottomRightView.backgroundColor = .black
        bottomRightView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(bottomRightView)
        self.bottomRightView = bottomRightView
        
        
        let bottomRightController = BottomRightViewController()
        bottomRightController.delegate = self
        
        ViewEmbedder.embed(
            parent: self,
            container: self.bottomRightView,
            child:bottomRightController,
            previous: nil)
        
        
        setupConstraints()
        
        NSLayoutConstraint.activate(sharedConstraints)
        if traitCollection.horizontalSizeClass == .compact {
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            NSLayoutConstraint.activate(regularConstraints)
        }
        
        self.view.setNeedsLayout()
    }
    
    func setupConstraints() {
        sharedConstraints.append( contentsOf:[
            
            NSLayoutConstraint(item: topView!, attribute: .leading, relatedBy: .equal, toItem: view!, attribute: .leading, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: view!, attribute: .trailing, relatedBy: .equal, toItem: topView!, attribute: .trailing, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: topView!, attribute: .top, relatedBy: .equal, toItem: view!, attribute: .top, multiplier: 1.0, constant: 30.0),
            
            NSLayoutConstraint(item: centerLeftView!, attribute: .leading, relatedBy: .equal, toItem: view!, attribute: .leading, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: centerLeftView!, attribute: .top, relatedBy: .equal, toItem: topView!, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view!, attribute: .bottom, relatedBy: .equal, toItem: bottomRightView!, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view!, attribute: .trailing, relatedBy: .equal, toItem: bottomRightView, attribute: .trailing, multiplier: 1.0, constant: 20.0),
        ])
        
        regularConstraints.append( contentsOf:[
            NSLayoutConstraint(item: topView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0),
            
            NSLayoutConstraint(item: centerLeftView!, attribute: .top, relatedBy: .equal, toItem: bottomRightView!, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view!, attribute: .bottom, relatedBy: .equal, toItem: centerLeftView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomRightView!, attribute: .leading, relatedBy: .equal, toItem: centerLeftView!, attribute: .trailing, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomRightView!, attribute: .width, relatedBy: .equal, toItem: centerLeftView!, attribute: .width, multiplier: 1.0, constant: 1.0),
        ])
        
        
        compactConstraints.append( contentsOf:[
            NSLayoutConstraint(item: topView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 200.0),
            NSLayoutConstraint(item: view!, attribute: .trailing, relatedBy: .equal, toItem: centerLeftView!, attribute: .trailing, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: bottomRightView!, attribute: .top, relatedBy: .equal, toItem: centerLeftView!, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomRightView!, attribute: .leading, relatedBy: .equal, toItem: view!, attribute: .leading, multiplier: 1.0, constant: 20.0),
            NSLayoutConstraint(item: bottomRightView!, attribute: .height, relatedBy: .equal, toItem: centerLeftView!, attribute: .height, multiplier: 1.0, constant: 1.0),
            
        ])
        
    }
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
        
        if (!sharedConstraints[0].isActive) {
            // activating shared constraints
            NSLayoutConstraint.activate(sharedConstraints)
        }
        
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if regularConstraints.count > 0 && regularConstraints[0].isActive {
                NSLayoutConstraint.deactivate(regularConstraints)
            }
            // activating compact constraints
            NSLayoutConstraint.activate(compactConstraints)
        } else {
            if compactConstraints.count > 0 && compactConstraints[0].isActive {
                NSLayoutConstraint.deactivate(compactConstraints)
            }
            // activating regular constraints
            NSLayoutConstraint.activate(regularConstraints)
        }
    }
    
    
}


//######################################################################################################
//######################################################################################################


extension ViewController : ButtonViewControllerDelegate {
    func buttonPrimaryTitleFor(tag: Int) -> String {
        
        return commandController.primaryLabelFor(tag : tag)
    }
    
    func buttonSecondaryTitleFor(tag: Int) -> String {
        return commandController.secondaryLabelFor(tag : tag)
    }
    
    func buttonTernaryTitleFor(tag: Int) -> String {
        return commandController.ternaryLabelFor(tag : tag)
        
    }
    
    func buttonAccessoryTitleFor(tag: Int) -> String {
        return commandController.accessoryLabelFor(tag : tag)
        
    }
    
    func buttonBackgroundImageName(tag: Int) -> String {
    
        if tag == 16 {
            return "OrangeButton1"
        }

        if tag == 17 {
            return "BlueButton1"
        }

        if tag == 30 {
            return "ButtonLarge1"
        }

        
        return "Button"
    
    }
    
    func didPressButtonWith(tag : Int) {
        print(" Pressed Button \(tag)")
        
        let keyString = commandController.resolveButton(tag:tag)
        
        commandController.executeCommand(keyString: keyString)

    }
    
    
}



extension ViewController : DisplayDelegate {
    
    func didChangeDisplayToError(value: String) {

      
          displayViewController.outputLabel.textColor = .red
        displayViewController.outputLabel.text! = value
 
    }
    
    func didClearError() {
        
        displayViewController.outputLabel.textColor = .black
        displayViewController.outputLabel.text! = ""

    }
    
 
    func didChangeDisplay(value: String) {

        displayViewController.outputLabel.text! = value
 
     }
     
    
    func didChangeState(_ state : KeyboardState) {

        switch state {
        case .FState:
            displayViewController.stateLabel.text! = "f"
            break
        case .GState:
            displayViewController.stateLabel.text! = "g"
            break
        default:
            displayViewController.stateLabel.text! = ""
            break
        }

    }
     
    func didChangeTrigonometricMode(_ mode: TrigonometricMode) {

            switch mode {
                case .deg:
                    displayViewController.trigonometricLabel.text! = ""
                    return
            case .rad :
                displayViewController.trigonometricLabel.text! = "RAD"
                return
            case .grad:
                displayViewController.trigonometricLabel.text! = "GRAD"
                return
            }
            


    }
     
}

