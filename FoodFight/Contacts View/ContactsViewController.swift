//
//  ContactsViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    var emptyLabel: UILabel!
    var tableView: UITableView!
    var users: [User] = [
        User(name: "Ilan Filonenko", email: "ilan@ilanfilonenko.com"),
        User(name: "Joe Antonakakis", email: "joe@joeantonakakis.com"),
        User(name: "Mehir Chauhan", email: "mehir@chauhan.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        navigationController?.navigationBar.barTintColor = UIColor.foodOrange()
        
        title = "FoodFight"
        
        setupData()
        setupTableView()
        setupEmptyLabel()
        OneSignal.defaultClient().registerForPushNotifications()
    }
    
    func setupData() {
        
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .Plain)
        tableView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        tableView.alpha = 0.0
        
        view.addSubview(tableView)
    }
    
    func setupEmptyLabel() {
        emptyLabel = UILabel()
        emptyLabel.text = "No contacts!"
        emptyLabel.font = UIFont.systemFontOfSize(14.0)
        emptyLabel.sizeToFit()
        emptyLabel.center = view.center
        view.addSubview(emptyLabel)
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

