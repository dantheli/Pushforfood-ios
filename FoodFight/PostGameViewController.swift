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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        played = true
    }
    
    func updateInfo(name: String, cuisine: String, address: String, phone: String, imageURL: String) {
        nameLabel.text = name
        cuisineLabel.text = cuisine
        addressLabel.text = address
        phoneLabel.text = phone
        if let url = NSURL(string: imageURL),
            let data = NSData(contentsOfURL: url) {
            imageView.image = UIImage(data: data)
        }
    }
}
