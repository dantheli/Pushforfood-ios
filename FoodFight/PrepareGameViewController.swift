//
//  PrepareGameViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class PrepareGameViewController: UIViewController {

    @IBOutlet var playerLabels: [UILabel]!
    
    @IBOutlet weak var readyButton: UIButton!
    @IBAction func readyButtonPressed(sender: UIButton) {
        startCountdown()
    }
    
    var players: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = UIImageView(image: UIImage(named: "banner"))
        
        for label in playerLabels {
            label.clipsToBounds = true
            label.layer.cornerRadius = label.frame.width / 2
            label.layer.borderColor = UIColor.whiteColor().CGColor
            label.layer.borderWidth = 4.0
            label.layer.backgroundColor = UIColor.foodOrange().CGColor
        }
    }
    
    func startCountdown() {
        readyButton.fadeHide()
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(36.0)
        label.text = "3"
        label.textColor = UIColor.foodOrange()
        label.sizeToFit()
        label.center = view.convertPoint(readyButton.center, fromView: readyButton.superview)
        label.alpha = 0.0
        view.addSubview(label)
        label.transform = CGAffineTransformMakeScale(0.0, 0.0)
        UIView.animateWithDuration(0.5, animations: {
            label.transform = CGAffineTransformMakeScale(1.0, 1.0)
            label.alpha = 1.0
            }, completion: { Void in
                UIView.animateWithDuration(0.5, animations: {
                    label.alpha = 0.0
                    }, completion: { Void in
                        label.text = "2"
                        label.transform = CGAffineTransformMakeScale(0.0, 0.0)
                        UIView.animateWithDuration(0.5, animations: {
                            label.transform = CGAffineTransformMakeScale(1.0, 1.0)
                            label.alpha = 1.0
                            }, completion: { Void in
                                UIView.animateWithDuration(0.5, animations: {
                                    label.alpha = 0.0
                                    }, completion: { Void in
                                        label.text = "1"
                                        label.transform = CGAffineTransformMakeScale(0.0, 0.0)
                                        UIView.animateWithDuration(0.5, animations: {
                                            label.transform = CGAffineTransformMakeScale(1.0, 1.0)
                                            label.alpha = 1.0
                                            }, completion: { Void in
                                                UIView.animateWithDuration(0.5, animations: {
                                                    label.alpha = 0.0
                                                    }, completion: { Void in
                                                        self.navigationController?.pushViewController(self.storyboard!.instantiateViewControllerWithIdentifier("GameViewController"), animated: true)
                                                })
                                        })

                                })
                        })
                })
        })
    }

}
