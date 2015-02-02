//
//  KeyboardViewController.swift
//  Keyboard
//
//  Created by Massimo Peri on 31/01/15.
//  Copyright (c) 2015 Massimo Peri. All rights reserved.
//

import UIKit


class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var deleteKeyboardButton: UIButton!
    @IBOutlet var nameKeyboardButton: UIButton!
    @IBOutlet var surnameKeyboardButton: UIButton!
    @IBOutlet var mailKeyboardButton: UIButton!

    var name: String?
    var surname: String?
    var mail: String?
    
    var buttonHeightConstraints: [NSLayoutConstraint]?
    var buttonSpacingConstraints: [NSLayoutConstraint]?
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve settings from user defaults.
        let userDefaults = NSUserDefaults(suiteName: "group.com.gmail.massimoperi.ios.Keybored")
        self.name = userDefaults?.stringForKey("Name")
        self.surname = userDefaults?.stringForKey("Surname")
        self.mail = userDefaults?.stringForKey("Mail")
        
        // Name keyboard button.
        self.nameKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.nameKeyboardButton.setTitle(NSLocalizedString("Name", comment: ""), forState: .Normal)
        self.nameKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.nameKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nameKeyboardButton.layer.cornerRadius = 5.0
        self.nameKeyboardButton.layer.shadowOpacity = 1.0
        self.nameKeyboardButton.layer.shadowRadius = 0.0
        self.nameKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.nameKeyboardButton.addTarget(self, action: "addName:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nameKeyboardButton)
        
        // Surname keyboard button.
        self.surnameKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.surnameKeyboardButton.setTitle(NSLocalizedString("Surname", comment: ""), forState: .Normal)
        self.surnameKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.surnameKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.surnameKeyboardButton.layer.cornerRadius = 5.0
        self.surnameKeyboardButton.layer.shadowOpacity = 1.0
        self.surnameKeyboardButton.layer.shadowRadius = 0.0
        self.surnameKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.surnameKeyboardButton.addTarget(self, action: "addSurname:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.surnameKeyboardButton)
        
        // Mail keyboard button.
        self.mailKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.mailKeyboardButton.setTitle(NSLocalizedString("Mail address", comment: ""), forState: .Normal)
        self.mailKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.mailKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.mailKeyboardButton.layer.cornerRadius = 5.0
        self.mailKeyboardButton.layer.shadowOpacity = 1.0
        self.mailKeyboardButton.layer.shadowRadius = 0.0
        self.mailKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.mailKeyboardButton.addTarget(self, action: "addMail:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.mailKeyboardButton)
        
        // Next keyboard button.
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.nextKeyboardButton.setImage(UIImage(named: "Next"), forState: .Normal)
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nextKeyboardButton.layer.cornerRadius = 5.0
        self.nextKeyboardButton.layer.shadowOpacity = 1.0
        self.nextKeyboardButton.layer.shadowRadius = 0.0
        self.nextKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nextKeyboardButton)
        
        // Delete keyboard button.
        self.deleteKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.deleteKeyboardButton.setImage(UIImage(named: "Delete"), forState: .Normal)
        self.deleteKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.deleteKeyboardButton.layer.cornerRadius = 5.0
        self.deleteKeyboardButton.layer.shadowOpacity = 1.0
        self.deleteKeyboardButton.layer.shadowRadius = 0.0
        self.deleteKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        deleteKeyboardButton.addTarget(self, action: "backspace:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.deleteKeyboardButton)

        self.setupConstraints()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.nameKeyboardButton.enabled = (self.name != nil) ? true : false
        self.surnameKeyboardButton.enabled = (self.surname != nil) ? true : false
        self.mailKeyboardButton.enabled = (self.mail != nil) ? true : false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
        var normalTextColor: UIColor
        var disabledTextColor: UIColor
        var backgroundColor: UIColor
        var accessoryBackgroundColor: UIColor
        var shadowColor: UIColor
        
        // Customize buttons depending on keyboard appearance.
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            normalTextColor = UIColor.whiteColor()
            disabledTextColor = UIColor(white: 1.0, alpha: 0.4)
            backgroundColor = UIColor(white: 0.0, alpha: 0.2)
            accessoryBackgroundColor = UIColor(white: 1.0, alpha: 0.2)
            shadowColor = UIColor.blackColor()
        } else {
            normalTextColor = UIColor.blackColor()
            disabledTextColor = UIColor(white: 0.0, alpha: 0.2)
            backgroundColor = UIColor(white: 1.0, alpha: 1.0)
            accessoryBackgroundColor = UIColor(red: 171.0/255.0, green: 181.0/255.0, blue: 190.0/255.0, alpha: 1.0)
            shadowColor = UIColor(red: 136.0/255.0, green: 139.0/255.0, blue: 143.0/255.0, alpha: 1.0)
        }
        
        self.nameKeyboardButton.setTitleColor(normalTextColor, forState: .Normal)
        self.nameKeyboardButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.nameKeyboardButton.backgroundColor = backgroundColor
        self.nameKeyboardButton.layer.shadowColor = shadowColor.CGColor
        
        self.surnameKeyboardButton.setTitleColor(normalTextColor, forState: .Normal)
        self.surnameKeyboardButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.surnameKeyboardButton.backgroundColor = backgroundColor
        self.surnameKeyboardButton.layer.shadowColor = shadowColor.CGColor
        
        self.mailKeyboardButton.setTitleColor(normalTextColor, forState: .Normal)
        self.mailKeyboardButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.mailKeyboardButton.backgroundColor = backgroundColor
        self.mailKeyboardButton.layer.shadowColor = shadowColor.CGColor
        
        self.nextKeyboardButton.tintColor = normalTextColor
        self.nextKeyboardButton.backgroundColor = accessoryBackgroundColor
        self.nextKeyboardButton.layer.shadowColor = shadowColor.CGColor
        
        self.deleteKeyboardButton.tintColor = normalTextColor
        self.deleteKeyboardButton.backgroundColor = accessoryBackgroundColor
        self.deleteKeyboardButton.layer.shadowColor = shadowColor.CGColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let heightConstraints = self.buttonHeightConstraints {
            self.view.removeConstraints(heightConstraints)
        }
        if let spacingConstraints = self.buttonSpacingConstraints {
            self.view.removeConstraints(spacingConstraints)
        }

        if ((UIDevice.currentDevice().userInterfaceIdiom == .Phone) && (UIScreen.mainScreen().bounds.size.width > UIScreen.mainScreen().bounds.size.height)) {
            var nameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var surnameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var mailKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var nextKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var deleteKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            self.buttonHeightConstraints = [nameKeyboardButtonHeightConstraint, surnameKeyboardButtonHeightConstraint, mailKeyboardButtonHeightConstraint, nextKeyboardButtonHeightConstraint, deleteKeyboardButtonHeightConstraint]
            
            var nameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 8.0)
            var surnameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.nameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
            var mailKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.surnameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
            self.buttonSpacingConstraints = [nameKeyboardButtonTopConstraint, surnameKeyboardButtonTopConstraint, mailKeyboardButtonTopConstraint]
        }
        else {
            var nameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var surnameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var mailKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var nextKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var deleteKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            self.buttonHeightConstraints = [nameKeyboardButtonHeightConstraint, surnameKeyboardButtonHeightConstraint, mailKeyboardButtonHeightConstraint, nextKeyboardButtonHeightConstraint, deleteKeyboardButtonHeightConstraint]
            
            var nameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 12.0)
            var surnameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.nameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
            var mailKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.surnameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
            self.buttonSpacingConstraints = [nameKeyboardButtonTopConstraint, surnameKeyboardButtonTopConstraint, mailKeyboardButtonTopConstraint]
        }

        self.view.addConstraints(self.buttonHeightConstraints!)
        self.view.addConstraints(self.buttonSpacingConstraints!)
    }
    
    // MARK: - Actions

    @IBAction func addName(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if let name = self.name {
            proxy.insertText(name)
        }
    }
    
    @IBAction func addSurname(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if let surname = self.surname {
            proxy.insertText(surname)
        }
    }
    
    @IBAction func addMail(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        if let mail = self.mail {
            proxy.insertText(mail)
        }
    }

    @IBAction func backspace(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    // MARK: - Private functions
    
    private func setupConstraints() {
        var nameKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        nameKeyboardButtonWidthConstraint.priority = 999
        var nameKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([nameKeyboardButtonWidthConstraint, nameKeyboardButtonLeftSideConstraint])
        
        var surnameKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        surnameKeyboardButtonWidthConstraint.priority = 999
        var surnameKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([surnameKeyboardButtonWidthConstraint, surnameKeyboardButtonLeftSideConstraint])
        
        var mailKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        mailKeyboardButtonWidthConstraint.priority = 999
        var mailKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([mailKeyboardButtonWidthConstraint, mailKeyboardButtonLeftSideConstraint])
        
        var nextKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([nextKeyboardButtonWidthConstraint, nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        var deleteKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        var deleteKeyboardButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -4.0)
        var deleteKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([deleteKeyboardButtonWidthConstraint, deleteKeyboardButtonRightSideConstraint, deleteKeyboardButtonBottomConstraint])
    }
    
}
