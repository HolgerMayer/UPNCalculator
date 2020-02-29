//
//  CoreDisplayViewController.swift
//  TraitCollTestProg
//
//  Created by holgermayer on 18.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import UIKit

class CoreDisplayViewController: UIViewController {

    var displayPanel = UIView()
    var outputLabel = UILabel()
    var stateLabel = UILabel()
    var trigonometricLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        createDisplay()
        createAutolayoutConstraints()
        setupFontSizes()
        
        initData()
    }
    

    private func createDisplay(){
        view.backgroundColor = .black
        
        displayPanel.backgroundColor = .lightGray
        displayPanel.layer.cornerRadius = 20.0
        displayPanel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(displayPanel)
        
        outputLabel.textAlignment = .right
        outputLabel.backgroundColor = .lightGray
        outputLabel.font =  UIFont(name: "DBLCDTempBlack", size: 60.0) //.systemFont(ofSize: 25.0)
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
        
        trigonometricLabel.textAlignment = .left
        trigonometricLabel.backgroundColor = .lightGray
        trigonometricLabel.font = .boldSystemFont(ofSize: 18.0)
        trigonometricLabel.text = ""
        trigonometricLabel.translatesAutoresizingMaskIntoConstraints = false
        trigonometricLabel.accessibilityIdentifier = "trigStateDisplay"
        
        displayPanel.addSubview(trigonometricLabel)
        
    }
    
    private func createAutolayoutConstraints(){
        
        // first set display constraints
        var constraint = NSLayoutConstraint(item: displayPanel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 40.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: displayPanel, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: -40.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: displayPanel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
 
        constraint = NSLayoutConstraint(item: displayPanel, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 5.0)
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
        
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .trailing, relatedBy: .equal, toItem: trigonometricLabel, attribute: .trailing, multiplier: 1.0, constant: 20.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: stateLabel, attribute: .top, relatedBy: .equal, toItem: outputLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: stateLabel, attribute: .bottom, relatedBy: .equal, toItem: displayPanel, attribute: .bottom, multiplier: 1.0, constant: -5.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: trigonometricLabel, attribute: .trailing, relatedBy: .equal, toItem: displayPanel, attribute: .trailing, multiplier: 1.0, constant: -40.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: trigonometricLabel, attribute: .top, relatedBy: .equal, toItem: outputLabel, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        constraint = NSLayoutConstraint(item: trigonometricLabel, attribute: .bottom, relatedBy: .equal, toItem: displayPanel, attribute: .bottom, multiplier: 1.0, constant: -5.0)
        view.addConstraint(constraint)

 }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
        super.traitCollectionDidChange(previousTraitCollection)
         
        setupFontSizes()
    }
    
    func setOutput(text : String) {
        outputLabel.text = text
    }
    
    func setState(text : String) {
        stateLabel.text = text
    }
    
    func setTrigonometric(text : String){
        trigonometricLabel.text = text
    }
    
    private func initData() {
        setOutput(text:" ")
        setState(text: " ")
        setTrigonometric(text:" ")

    }
    
    private func setupFontSizes() {
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            outputLabel.font =  UIFont(name: "DBLCDTempBlack", size: 24.0)
            stateLabel.font = .boldSystemFont(ofSize: 10.0)
            trigonometricLabel.font = .boldSystemFont(ofSize: 10.0)
        } else {
            outputLabel.font =  UIFont(name: "DBLCDTempBlack", size: 60.0)
            stateLabel.font = .boldSystemFont(ofSize: 18.0)
            trigonometricLabel.font = .boldSystemFont(ofSize: 18.0)
        }
    }

}
