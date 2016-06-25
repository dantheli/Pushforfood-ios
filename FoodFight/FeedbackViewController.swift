//
//  FeedbackViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        let label = UILabel()
        label.text = "Did you enjoy that restaurant?"
        label.textColor = UIColor.darkGrayColor()
        label.sizeToFit()
        label.textAlignment = .Center
        label.center = CGPoint(x: view.frame.midX, y: 66.0)
        view.addSubview(label)
        
        let segmentedControl = UISegmentedControl(items: ["YES", "NO"])
        segmentedControl.addTarget(self, action: #selector(segmentedControlPressed), forControlEvents: .AllTouchEvents)
        segmentedControl.center = view.center
        view.addSubview(segmentedControl)
    }
    
    func segmentedControlPressed() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
