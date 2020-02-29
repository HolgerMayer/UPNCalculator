//
//  ButtonArrayViewController.swift
//  TraitCollTestProg
//
//  Created by holgermayer on 21.02.20.
//  Copyright © 2020 holgermayer. All rights reserved.
//

import UIKit

public protocol ButtonViewControllerDelegate : AnyObject {
    func buttonPrimaryTitleFor(tag  : Int) -> String
    func buttonSecondaryTitleFor(tag  : Int) -> String
    func buttonTernaryTitleFor(tag  : Int) -> String
    func buttonAccessoryTitleFor(tag  : Int) -> String
    func buttonBackgroundImageName(tag: Int) -> String
    func didPressButtonWith(tag : Int)
}


class ButtonArrayViewController: UIViewController {

    weak var delegate : ButtonViewControllerDelegate?
    
    var tagOffset = 0
    var maxButtons = 20
    var buttons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createButtons()
        createAutolayoutConstraints()
    }
    
    
    func createAutolayoutConstraints() {
        createRow1AutoConstraints()
        createRow2AutoConstraints()
        createRow3AutoConstraints()
        createRow4AutoConstraints()
    }


    func createButtons() {
        
        for i in 0..<maxButtons{
            
            let button = createButton(tag:i+tagOffset)
            
            buttons.append(button)
            view.addSubview(button)
        }
    }
    
    private func createButton( tag : Int) -> UIButton  {
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        // *** set LineSpacing property in points ***
        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points
        paragraphStyle.alignment = .center
        
        guard let delegate = delegate else {
            return UIButton()
        }
        
        let title2 : String = delegate.buttonPrimaryTitleFor(tag: tag)
        let title1 : String = delegate.buttonSecondaryTitleFor(tag: tag)
        let title3: String = delegate.buttonTernaryTitleFor(tag: tag)
        let accessoryLabel : String = delegate.buttonAccessoryTitleFor(tag: tag)
        
        
        let attributedTitle1 = NSMutableAttributedString(string:title1 + "\n" )
        attributedTitle1.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.orange, range: NSMakeRange(0, attributedTitle1.length))
        attributedTitle1.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: NSMakeRange(0, attributedTitle1.length))
        attributedTitle1.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedTitle1.length))
        
        let attributedTitle2 = NSMutableAttributedString(string: title2 + "\n")
        attributedTitle2.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range: NSMakeRange(0, attributedTitle2.length))
        attributedTitle2.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 18), range: NSMakeRange(0, attributedTitle2.length))
        
        let attributedTitle3 = NSMutableAttributedString(string:  title3 + "\n" )
        attributedTitle3.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.cyan, range: NSMakeRange(0, attributedTitle3.length))
        attributedTitle3.addAttribute(NSAttributedString.Key.font, value:UIFont.boldSystemFont(ofSize: 14), range: NSMakeRange(0, attributedTitle3.length))
        
        let attributedTitle  = NSMutableAttributedString()
        attributedTitle.append(attributedTitle1)
        attributedTitle.append(attributedTitle2)
        attributedTitle.append(attributedTitle3)
        
        let button = UIButton()
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.numberOfLines = 0
        button.layer.borderWidth = 0.5
        button.tag = tag
        
        let imageName = delegate.buttonBackgroundImageName(tag: tag)
        button.setBackgroundImage(UIImage(named: imageName), for: .normal)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25.0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.accessibilityLabel = accessoryLabel
        return button
    }
    
    
    func createRow1AutoConstraints() {
        
        // Button 0
        
        var constraint = NSLayoutConstraint(item: view!, attribute: .top, relatedBy: .equal, toItem: buttons[0], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:view!, attribute: .leading, relatedBy: .equal, toItem:  buttons[0], attribute: .leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        // Button 1
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .top, relatedBy: .equal, toItem: buttons[1], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[1], attribute: .leading, relatedBy: .equal, toItem:  buttons[0], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[1], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 2
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .top, relatedBy: .equal, toItem: buttons[2], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[2], attribute: .leading, relatedBy: .equal, toItem:  buttons[1], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[2], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 3
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .top, relatedBy: .equal, toItem: buttons[3], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[3], attribute: .leading, relatedBy: .equal, toItem:  buttons[2], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
          
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[3], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        // Button 4
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .top, relatedBy: .equal, toItem: buttons[4], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[4], attribute: .leading, relatedBy: .equal, toItem:  buttons[3], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[4], attribute: .trailing, relatedBy: .equal, toItem:  view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[4], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        
        
        // Reihe 1 equal width
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[1], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[2], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[3], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[4], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        
    }
    
    func createRow2AutoConstraints() {
        
        // Button 5
        
        var constraint = NSLayoutConstraint(item: buttons[0], attribute: .bottom, relatedBy: .equal, toItem: buttons[5], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:view!, attribute: .leading, relatedBy: .equal, toItem:  buttons[5], attribute: .leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[5], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        // Button 6
        
        constraint = NSLayoutConstraint(item: buttons[5], attribute: .top, relatedBy: .equal, toItem: buttons[6], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[6], attribute: .leading, relatedBy: .equal, toItem:  buttons[5], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[6], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 7
        
        constraint = NSLayoutConstraint(item: buttons[5], attribute: .top, relatedBy: .equal, toItem: buttons[7], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[7], attribute: .leading, relatedBy: .equal, toItem:  buttons[6], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[7], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        // Button 8
        
        constraint = NSLayoutConstraint(item: buttons[5], attribute: .top, relatedBy: .equal, toItem: buttons[8], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[8], attribute: .leading, relatedBy: .equal, toItem:  buttons[7], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
          
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[8], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
   
        // Button 9
        
        constraint = NSLayoutConstraint(item: buttons[5], attribute: .top, relatedBy: .equal, toItem: buttons[9], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[9], attribute: .leading, relatedBy: .equal, toItem:  buttons[8], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[9], attribute: .trailing, relatedBy: .equal, toItem:  view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[9], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        
    
        
        // Reihe 2 equal width
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[5], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[6], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[7], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[8], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[9], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        
    }
    
    func createRow3AutoConstraints() {
        
        // Button 10
        
        var constraint = NSLayoutConstraint(item: buttons[5], attribute: .bottom, relatedBy: .equal, toItem: buttons[10], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:view!, attribute: .leading, relatedBy: .equal, toItem:  buttons[10], attribute: .leading, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[10], attribute: .height, multiplier: 1.0, constant: 0.0)
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
    
    func createRow4AutoConstraints() {
        
        // Button 15
        
        var constraint = NSLayoutConstraint(item: buttons[10], attribute: .bottom, relatedBy: .equal, toItem: buttons[15], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:view!, attribute: .leading, relatedBy: .equal, toItem:  buttons[15], attribute: .leading, multiplier: 1.0, constant: 0.0)
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
        
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[18], attribute: .height, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
 
        // Button 19
        
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .top, relatedBy: .equal, toItem: buttons[19], attribute: .top, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[19], attribute: .leading, relatedBy: .equal, toItem:  buttons[18], attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item:buttons[19], attribute: .trailing, relatedBy: .equal, toItem:  view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .height, relatedBy: .equal, toItem: buttons[19], attribute: .height, multiplier: 1.0, constant: 0.0)
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
        constraint = NSLayoutConstraint(item: buttons[0], attribute: .width, relatedBy: .equal, toItem: buttons[19], attribute: .width, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

        // Constraint to bottom
        
        constraint = NSLayoutConstraint(item: buttons[15], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[16], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[17], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[18], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)
        constraint = NSLayoutConstraint(item: buttons[19], attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        view.addConstraint(constraint)

    }
    
    
    
    @IBAction func buttonTapped(_ sender : UIButton){
        guard let delegate = delegate else {
            return
        }
        
        delegate.didPressButtonWith(tag: sender.tag)
        
    }
    
}
