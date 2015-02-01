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
        self.nameKeyboardButton.backgroundColor = UIColor(white: 1.0, alpha: 0.4)
        self.nameKeyboardButton.layer.cornerRadius = 5.0
        self.nameKeyboardButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.nameKeyboardButton.layer.shadowOpacity = 0.8
        self.nameKeyboardButton.layer.shadowRadius = 1.0
        self.nameKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.nameKeyboardButton.addTarget(self, action: "addName:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nameKeyboardButton)
        
        var nameKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        nameKeyboardButtonWidthConstraint.priority = 999
        var nameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
        var nameKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        var nameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.nameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 12.0)
        self.view.addConstraints([nameKeyboardButtonWidthConstraint, nameKeyboardButtonHeightConstraint, nameKeyboardButtonLeftSideConstraint, nameKeyboardButtonTopConstraint])

        // Surname keyboard button.
        self.surnameKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.surnameKeyboardButton.setTitle(NSLocalizedString("Surname", comment: ""), forState: .Normal)
        self.surnameKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.surnameKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.surnameKeyboardButton.backgroundColor = UIColor(white: 1.0, alpha: 0.4)
        self.surnameKeyboardButton.layer.cornerRadius = 5.0
        self.surnameKeyboardButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.surnameKeyboardButton.layer.shadowOpacity = 0.8
        self.surnameKeyboardButton.layer.shadowRadius = 1.0
        self.surnameKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.surnameKeyboardButton.addTarget(self, action: "addSurname:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.surnameKeyboardButton)
        
        var surnameKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        surnameKeyboardButtonWidthConstraint.priority = 999
        var surnameKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
        var surnameKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        var surnameKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.surnameKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.nameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
        self.view.addConstraints([surnameKeyboardButtonWidthConstraint, surnameKeyboardButtonHeightConstraint, surnameKeyboardButtonLeftSideConstraint, surnameKeyboardButtonTopConstraint])

        // Mail keyboard button.
        self.mailKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.mailKeyboardButton.setTitle(NSLocalizedString("Mail address", comment: ""), forState: .Normal)
        self.mailKeyboardButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.mailKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.mailKeyboardButton.backgroundColor = UIColor(white: 1.0, alpha: 0.4)
        self.mailKeyboardButton.layer.cornerRadius = 5.0
        self.mailKeyboardButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.mailKeyboardButton.layer.shadowOpacity = 0.8
        self.mailKeyboardButton.layer.shadowRadius = 1.0
        self.mailKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.mailKeyboardButton.addTarget(self, action: "addMail:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.mailKeyboardButton)
        
        var mailKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        mailKeyboardButtonWidthConstraint.priority = 999
        var mailKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
        var mailKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        var mailKeyboardButtonTopConstraint = NSLayoutConstraint(item: self.mailKeyboardButton, attribute: .Top, relatedBy: .Equal, toItem: self.surnameKeyboardButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
        self.view.addConstraints([mailKeyboardButtonWidthConstraint, mailKeyboardButtonHeightConstraint, mailKeyboardButtonLeftSideConstraint, mailKeyboardButtonTopConstraint])
        
        // Next keyboard button.
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.nextKeyboardButton.setImage(UIImage(named: "Next"), forState: .Normal)
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nextKeyboardButton.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        self.nextKeyboardButton.layer.cornerRadius = 5.0
        self.nextKeyboardButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.nextKeyboardButton.layer.shadowOpacity = 0.8
        self.nextKeyboardButton.layer.shadowRadius = 1.0
        self.nextKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nextKeyboardButton)

        var nextKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        var nextKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([nextKeyboardButtonWidthConstraint, nextKeyboardButtonHeightConstraint, nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        
        // Delete keyboard button.
        self.deleteKeyboardButton = UIButton.buttonWithType(.System) as UIButton
        self.deleteKeyboardButton.setImage(UIImage(named: "Delete"), forState: .Normal)
        self.deleteKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.deleteKeyboardButton.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        self.deleteKeyboardButton.layer.cornerRadius = 5.0
        self.deleteKeyboardButton.layer.shadowColor = UIColor.blackColor().CGColor
        self.deleteKeyboardButton.layer.shadowOpacity = 0.8
        self.deleteKeyboardButton.layer.shadowRadius = 1.0
        self.deleteKeyboardButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        deleteKeyboardButton.addTarget(self, action: "backspace:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.deleteKeyboardButton)
        
        var deleteKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        var deleteKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
        var deleteKeyboardButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -4.0)
        var deleteKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.deleteKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([deleteKeyboardButtonWidthConstraint, deleteKeyboardButtonHeightConstraint, deleteKeyboardButtonRightSideConstraint, deleteKeyboardButtonBottomConstraint])
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
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        
        self.nameKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.surnameKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.mailKeyboardButton.setTitleColor(textColor, forState: .Normal)
        self.nextKeyboardButton.tintColor = textColor
        self.deleteKeyboardButton.tintColor = textColor
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
    
}
