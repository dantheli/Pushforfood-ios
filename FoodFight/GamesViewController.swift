//
//  GamesViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class GamesViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setTheme()
        navigationItem.titleView = UIImageView(image: UIImage(named: "banner"))
        
        setupTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .Plain)
        
        view.addSubview(tableView)
    }
    
}
