//
//  BottomRightViewController.swift
//  TraitCollTestProg
//
//  Created by holgermayer on 20.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import UIKit

class BottomRightViewController: ButtonArrayViewController {

    
    override func viewDidLoad() {
        tagOffset = 20
        maxButtons =  19
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
     }
    
  
    
    override func createRow3AutoConstraints() {
        
        // Button 10
        
        var constraint = NSLayoutConstraint(item: buttons[5], attribute: .bottom, relatedBy: .equal, toItem: buttons[10], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:view!, attribute: .leading, relatedBy: .equal, toItem:  buttons[10], attribute: .leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
         
        
        // Button 11
        
        constraint = NSLayoutConstraint(item: buttons[10], attribute: .top, relatedBy: .equal, toItem: buttons[11], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[11], attribute: .leading, relatedBy: .equal, toItem:  buttons[10], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[11], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 12
        
        constraint = NSLayoutConstraint(item: buttons[10], attribute: .top, relatedBy: .equal, toItem: buttons[12], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[12], attribute: .leading, relatedBy: .equal, toItem:  buttons[11], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[12], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 13
        
        constraint = NSLayoutConstraint(item: buttons[10], attribute: .top, relatedBy: .equal, toItem: buttons[13], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[13], attribute: .leading, relatedBy: .equal, toItem:  buttons[12], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[13], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 14
        
        constraint = NSLayoutConstraint(item: buttons[10], attribute: .top, relatedBy: .equal, toItem: buttons[14], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[14], attribute: .leading, relatedBy: .equal, toItem:  buttons[13], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[14], attribute: .trailing, relatedBy: .equal, toItem:  view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[14], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        
        // Reihe 3 equal width
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[10], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[11], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[12], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[13], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[14], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
     
    }
    
    
    override func createRow4AutoConstraints() {
        
        // Button 15
        
        var constraint = NSLayoutConstraint(item: buttons[11], attribute: .bottom, relatedBy: .equal, toItem: buttons[15], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[11], attribute: .leading, relatedBy: .equal, toItem:  buttons[15], attribute: .leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[15], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        // Button 16
        
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .top, relatedBy: .equal, toItem: buttons[16], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[16], attribute: .leading, relatedBy: .equal, toItem:  buttons[15], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[16], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 17
        
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .top, relatedBy: .equal, toItem: buttons[17], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[17], attribute: .leading, relatedBy: .equal, toItem:  buttons[16], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[17], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 18
        
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .top, relatedBy: .equal, toItem: buttons[18], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[18], attribute: .leading, relatedBy: .equal, toItem:  buttons[17], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[18], attribute: .trailing, relatedBy: .equal, toItem:  view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[18], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
          
        
        // Reihe 3 equal width
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[15], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[16], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[17], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[18], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
         
        // Constraint to bottom
        
        constraint = NSLayoutConstraint(item: buttons[10], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[16], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[17], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[18], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

         
    }
    
    
}
