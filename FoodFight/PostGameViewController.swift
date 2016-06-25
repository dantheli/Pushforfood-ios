//
//  PostGameViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class PostGameViewController: UIViewController {

    @IBAction func xButtonPressed(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("MainMenu", object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
