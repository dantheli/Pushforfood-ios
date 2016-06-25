//
//  PrepareGameViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class PrepareGameViewController: UIViewController {

    @IBOutlet var playerLabels: [UILabel]!
    
    var players: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "banner"))
        
        for label in playerLabels {
            label.clipsToBounds = true
            label.layer.cornerRadius = label.frame.width / 2
            label.layer.borderColor = UIColor.whiteColor().CGColor
            label.layer.borderWidth = 4.0
        }
    }

}
