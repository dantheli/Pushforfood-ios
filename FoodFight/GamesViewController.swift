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
        
    presentViewController(storyboard!.instantiateViewControllerWithIdentifier("OnboardingViewController"), animated: true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .Plain)
        
        view.addSubview(tableView)
    }
    
}
