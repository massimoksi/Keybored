// KeyboardViewController.swift
//
// Copyright (c) 2015 Massimo Peri (@massimoksi)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit


class KeyboardViewController: UIInputViewController {

    @IBOutlet var nameButton: UIButton!
    @IBOutlet var surnameButton: UIButton!
    @IBOutlet var mailButton: UIButton!
    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var spaceButton: UIButton!
    @IBOutlet var deleteButton: UIButton!

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
        
        // Name button.
        self.nameButton = UIButton.buttonWithType(.System) as UIButton
        self.nameButton.setTitle(NSLocalizedString("Name", comment: ""), forState: .Normal)
        self.nameButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.nameButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.nameButton.layer.cornerRadius = 5.0
        self.nameButton.layer.shadowOpacity = 1.0
        self.nameButton.layer.shadowRadius = 0.0
        self.nameButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.nameButton.addTarget(self, action: "addName:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.nameButton)
        
        // Surname button.
        self.surnameButton = UIButton.buttonWithType(.System) as UIButton
        self.surnameButton.setTitle(NSLocalizedString("Surname", comment: ""), forState: .Normal)
        self.surnameButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.surnameButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.surnameButton.layer.cornerRadius = 5.0
        self.surnameButton.layer.shadowOpacity = 1.0
        self.surnameButton.layer.shadowRadius = 0.0
        self.surnameButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.surnameButton.addTarget(self, action: "addSurname:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.surnameButton)
        
        // Mail button.
        self.mailButton = UIButton.buttonWithType(.System) as UIButton
        self.mailButton.setTitle(NSLocalizedString("E-mail", comment: ""), forState: .Normal)
        self.mailButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.mailButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.mailButton.layer.cornerRadius = 5.0
        self.mailButton.layer.shadowOpacity = 1.0
        self.mailButton.layer.shadowRadius = 0.0
        self.mailButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.mailButton.addTarget(self, action: "addMail:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.mailButton)
        
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
        
        // Space button.
        self.spaceButton = UIButton.buttonWithType(.System) as UIButton
        self.spaceButton.setTitle(NSLocalizedString("space", comment: ""), forState: .Normal)
        self.spaceButton.titleLabel?.font = UIFont.systemFontOfSize(21.0)
        self.spaceButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.spaceButton.layer.cornerRadius = 5.0
        self.spaceButton.layer.shadowOpacity = 1.0
        self.spaceButton.layer.shadowRadius = 0.0
        self.spaceButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.spaceButton.addTarget(self, action: "addSpace:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.spaceButton)
        
        // Delete button.
        self.deleteButton = UIButton.buttonWithType(.System) as UIButton
        self.deleteButton.setImage(UIImage(named: "Delete"), forState: .Normal)
        self.deleteButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.deleteButton.layer.cornerRadius = 5.0
        self.deleteButton.layer.shadowOpacity = 1.0
        self.deleteButton.layer.shadowRadius = 0.0
        self.deleteButton.layer.shadowOffset = CGSizeMake(0.0, 1.0)
        self.deleteButton.addTarget(self, action: "backspace:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.deleteButton)

        self.setupConstraints()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.nameButton.enabled = (self.name != nil) ? true : false
        self.surnameButton.enabled = (self.surname != nil) ? true : false
        self.mailButton.enabled = (self.mail != nil) ? true : false
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
        
        self.nameButton.setTitleColor(normalTextColor, forState: .Normal)
        self.nameButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.nameButton.backgroundColor = backgroundColor
        self.nameButton.layer.shadowColor = shadowColor.CGColor
        
        self.surnameButton.setTitleColor(normalTextColor, forState: .Normal)
        self.surnameButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.surnameButton.backgroundColor = backgroundColor
        self.surnameButton.layer.shadowColor = shadowColor.CGColor
        
        self.mailButton.setTitleColor(normalTextColor, forState: .Normal)
        self.mailButton.setTitleColor(disabledTextColor, forState: .Disabled)
        self.mailButton.backgroundColor = backgroundColor
        self.mailButton.layer.shadowColor = shadowColor.CGColor
        
        self.nextKeyboardButton.tintColor = normalTextColor
        self.nextKeyboardButton.backgroundColor = accessoryBackgroundColor
        self.nextKeyboardButton.layer.shadowColor = shadowColor.CGColor

        self.spaceButton.setTitleColor(normalTextColor, forState: .Normal)
        self.spaceButton.backgroundColor = backgroundColor
        self.spaceButton.layer.shadowColor = shadowColor.CGColor
        
        self.deleteButton.tintColor = normalTextColor
        self.deleteButton.backgroundColor = accessoryBackgroundColor
        self.deleteButton.layer.shadowColor = shadowColor.CGColor
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
            var nameButtonHeightConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var surnameButtonHeightConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var mailButtonHeightConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var nextKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var spaceButtonHeightConstraint = NSLayoutConstraint(item: self.spaceButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            var deleteButtonHeightConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 30.0)
            self.buttonHeightConstraints = [
                nameButtonHeightConstraint,
                surnameButtonHeightConstraint,
                mailButtonHeightConstraint,
                nextKeyboardButtonHeightConstraint,
                spaceButtonHeightConstraint,
                deleteButtonHeightConstraint
            ]
            
            var nameButtonTopConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 8.0)
            var surnameButtonTopConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Top, relatedBy: .Equal, toItem: self.nameButton, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
            var mailButtonTopConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Top, relatedBy: .Equal, toItem: self.surnameButton, attribute: .Bottom, multiplier: 1.0, constant: 8.0)
            self.buttonSpacingConstraints = [
                nameButtonTopConstraint,
                surnameButtonTopConstraint,
                mailButtonTopConstraint
            ]
        }
        else {
            var nameButtonHeightConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var surnameButtonHeightConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var mailButtonHeightConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var nextKeyboardButtonHeightConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var spaceButtonHeightConstraint = NSLayoutConstraint(item: self.spaceButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            var deleteButtonHeightConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 41.0)
            self.buttonHeightConstraints = [
                nameButtonHeightConstraint,
                surnameButtonHeightConstraint,
                mailButtonHeightConstraint,
                nextKeyboardButtonHeightConstraint,
                spaceButtonHeightConstraint,
                deleteButtonHeightConstraint
            ]
            
            var nameButtonTopConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1.0, constant: 12.0)
            var surnameButtonTopConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Top, relatedBy: .Equal, toItem: self.nameButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
            var mailButtonTopConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Top, relatedBy: .Equal, toItem: self.surnameButton, attribute: .Bottom, multiplier: 1.0, constant: 12.0)
            self.buttonSpacingConstraints = [
                nameButtonTopConstraint,
                surnameButtonTopConstraint,
                mailButtonTopConstraint
            ]
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

    @IBAction func addSpace(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.insertText(" ")
    }
    
    @IBAction func backspace(sender: UIButton) {
        let proxy = self.textDocumentProxy as UITextDocumentProxy
        proxy.deleteBackward()
    }
    
    // MARK: - Private functions
    
    private func setupConstraints() {
        let nameButtonWidthConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        nameButtonWidthConstraint.priority = 999
        let nameButtonLeftSideConstraint = NSLayoutConstraint(item: self.nameButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([nameButtonWidthConstraint, nameButtonLeftSideConstraint])
        
        let surnameButtonWidthConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        surnameButtonWidthConstraint.priority = 999
        let surnameButtonLeftSideConstraint = NSLayoutConstraint(item: self.surnameButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([surnameButtonWidthConstraint, surnameButtonLeftSideConstraint])
        
        let mailButtonWidthConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 1.0, constant: -8.0)
        mailButtonWidthConstraint.priority = 999
        let mailButtonLeftSideConstraint = NSLayoutConstraint(item: self.mailButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        self.view.addConstraints([mailButtonWidthConstraint, mailButtonLeftSideConstraint])
        
        let nextKeyboardButtonWidthConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 4.0)
        let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([nextKeyboardButtonWidthConstraint, nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])

        let spaceButtonLeadingConstraint = NSLayoutConstraint(item: self.spaceButton, attribute: .Leading, relatedBy: .Equal, toItem: self.nextKeyboardButton, attribute: .Trailing, multiplier: 1.0, constant: 8.0)
        spaceButtonLeadingConstraint.priority = 999
        let spaceButtonTrailingConstraint = NSLayoutConstraint(item: self.spaceButton, attribute: .Trailing, relatedBy: .Equal, toItem: self.deleteButton, attribute: .Leading, multiplier: 1.0, constant: -8.0)
        let spaceButtonBottomConstraint = NSLayoutConstraint(item: self.spaceButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([spaceButtonLeadingConstraint, spaceButtonTrailingConstraint, spaceButtonBottomConstraint])
        
        let deleteButtonWidthConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 42.0)
        let deleteButtonRightSideConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -4.0)
        let deleteButtonBottomConstraint = NSLayoutConstraint(item: self.deleteButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -4.0)
        self.view.addConstraints([deleteButtonWidthConstraint, deleteButtonRightSideConstraint, deleteButtonBottomConstraint])
    }
    
}
