//
//  ContactsViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import TextFieldEffects

class ContactsViewController: UIViewController {

    var infoLabel: UILabel!
    
    @IBOutlet weak var createButton: UIButton!
    @IBAction func createButtonPressed(sender: UIButton) {
        navigationController?.pushViewController(storyboard!.instantiateViewControllerWithIdentifier("GameViewController"), animated: true)
    }
    @IBOutlet weak var firstField: HoshiTextField!
    @IBOutlet weak var secondField: HoshiTextField!
    @IBOutlet weak var thirdField: HoshiTextField!
    
    var users: [User] = [
        User(name: "Ilan Filonenko", email: "ilan@ilanfilonenko.com"),
        User(name: "Joe Antonakakis", email: "joe@joeantonakakis.com"),
        User(name: "Mehir Chauhan", email: "mehir@chauhan.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        navigationController?.setTheme()
        
        title = "FoodFight"
        
        setupData()
        
        OneSignal.defaultClient().registerForPushNotifications()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func setupData() {
        
    }
}