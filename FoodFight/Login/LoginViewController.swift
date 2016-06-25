//
//  LoginViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailField.delegate = self
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        login()
        return true
    }
}
