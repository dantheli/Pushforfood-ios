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
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cuisineLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var restaurant: Restaurant!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        played = true
        updateInfo(restaurant.name, cuisine: restaurant.cuisine, address: restaurant.address, phone: "(837) 234-2398", imageURL: "")
    }
    
    func updateInfo(name: String, cuisine: String, address: String, phone: String, imageURL: String) {
        nameLabel.text = name
        cuisineLabel.text = cuisine
        addressLabel.text = address
        phoneLabel.text = phone
    }
}
