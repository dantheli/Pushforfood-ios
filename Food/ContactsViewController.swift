//
//  ContactsViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController {

    var tableView: UITableView!
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .Plain)
        tableView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.registerNib(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        
        view.addSubview(tableView)
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

extension ContactsViewController {
    
}

