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
    var tableView: UITableView!
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
    
    func setupData() {
        
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath) as! UserCell
        
        let user = users[indexPath.row]
        
        cell.nameLabel.text = user.name
        
        return cell
    }
}

