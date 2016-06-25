//
//  GamesViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

var alreadyOnboarded = false

class GamesViewController: UIViewController {

    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setTheme()
        
        setupTableView()
        if !alreadyOnboarded {
            presentViewController(storyboard!.instantiateViewControllerWithIdentifier("OnboardingViewController"), animated: true, completion: nil)
            alreadyOnboarded = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame, style: .Plain)
        
        view.addSubview(tableView)
    }
    
}
