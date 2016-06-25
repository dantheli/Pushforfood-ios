//
//  GameViewController.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import SocketIOClientSwift

class GameViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var buttonsContainer: UIView!
    
    var socket: SocketIOClient!
    var timer: NSTimer!
    var countDown = 3 {
        didSet {
            countDownLabel.text = "\(countDown)"
            if countDown == 0 {
                Network.play { restaurant in
                    if let restaurant = restaurant {
                        let vc = self.storyboard!.instantiateViewControllerWithIdentifier("PostGameViewController") as! PostGameViewController
                        vc.restaurant = restaurant
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                }
            }
        }
    }
    @IBOutlet weak var countDownLabel: UILabel!
    
    func setupSocket() {
        socket = SocketIOClient(socketURL: NSURL(string: "")!)
        socket.onAny { event in
            print("Got socket with event: \(event.event)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateCountDown), userInfo: nil, repeats: true)
        timer.fire()
        for button in buttons {
            button.addTarget(self, action: #selector(buttonPressed(_:)), forControlEvents: .TouchDown)
            button.adjustsImageWhenHighlighted = false
        }
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func updateCountDown() {
        countDown -= 1
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
