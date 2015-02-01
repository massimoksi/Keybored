//
//  SettingsTableViewController.swift
//  Keybored
//
//  Created by Massimo Peri on 31/01/15.
//  Copyright (c) 2015 Massimo Peri. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let userDefaults = NSUserDefaults(suiteName: "group.com.gmail.massimoperi.ios.Keybored")
        self.nameTextField.text = userDefaults?.stringForKey("Name")
        self.surnameTextField.text = userDefaults?.stringForKey("Surname")
        self.mailTextField.text = userDefaults?.stringForKey("Mail")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }
    
    // MARK: - Text field delegate
    
    func textFieldDidEndEditing(textField: UITextField) {
        let userDefaults = NSUserDefaults(suiteName: "group.com.gmail.massimoperi.ios.Keybored")
        let text = textField.text
        
        switch (textField.tag) {
        case 1:
            userDefaults?.setObject(text, forKey: "Name")
            
        case 2:
            userDefaults?.setObject(text, forKey: "Surname")
        
        case 3:
            userDefaults?.setObject(text, forKey: "Mail")
            
        default:
            break
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
}

