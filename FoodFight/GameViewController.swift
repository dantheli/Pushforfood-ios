//
//  GameViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var buttonsContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.addTarget(self, action: #selector(buttonPressed(_:)), forControlEvents: .TouchDown)
        }
        
    }
    
    func buttonPressed(button: UIButton) {
        animateButtonTap(atIndex: button.tag, withColor: UIColor.orangeColor())
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        for button in buttons {
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.width / 2
            button.backgroundColor = UIColor.whiteColor()
            button.tintColor = UIColor.darkGrayColor()
            button.layer.borderColor = UIColor.lightGrayColor().CGColor
            button.layer.borderWidth = 1.0
            button.transform = CGAffineTransformMakeScale(0.75, 0.75)
        }
    }
    
    func animateButtonTap(atIndex index: Int, withColor color: UIColor) {
        let button = buttons[index]
        let fadeCircle = UIView(frame: button.frame)
        fadeCircle.backgroundColor = color
        fadeCircle.layer.cornerRadius = fadeCircle.bounds.width / 2
        buttonsContainer.addSubview(fadeCircle)
        buttonsContainer.bringSubviewToFront(button)
        UIView.animateWithDuration(0.55, animations: {
            fadeCircle.transform = CGAffineTransformMakeScale(1.3, 1.3)
            fadeCircle.alpha = 0.0
        }) { Void in
            fadeCircle.removeFromSuperview()
        }
    }

}
