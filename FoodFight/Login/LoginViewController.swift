//
//  LoginViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameField: UITextField!
    @IBAction func nameField(sender: UITextField) {
        updateButton()
    }
    @IBOutlet weak var emailField: UITextField!
    @IBAction func emailField(sender: UITextField) {
        updateButton()
    }
    
    @IBOutlet weak var signIn: UIButton!
    @IBAction func signInButtonPressed(sender: UIButton) {
        login()
    }
    
    func updateButton() {
        signIn.enabled = !(nameField.text?.isEmpty ?? true) && !(emailField.text?.isEmpty ?? true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signIn.enabled = false
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func login() {
        // Login logic
        Network.signIn(emailField.text ?? "") { error in
            if let error = error {
                self.displayError(error, completion: nil)
            } else {
                NSNotificationCenter.defaultCenter().postNotificationName("UserSignedIn", object: nil)
            }
        }
    }
}
