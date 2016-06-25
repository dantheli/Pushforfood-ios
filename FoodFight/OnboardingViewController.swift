//
//  OnboardingViewController.swift
//  FoodFight
//
//  Created by Daniel Li on 6/25/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit
import Koloda

class OnboardingViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    @IBOutlet weak var crossButton: UIButton!
    @IBAction func crossButtonPressed(sender: UIButton) {
        kolodaView.swipe(.Left)
    }
    @IBOutlet weak var checkButton: UIButton!
    @IBAction func checkButtonPressed(sender: UIButton) {
        kolodaView.swipe(.Right)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.foodOrange()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        crossButton.layer.backgroundColor = UIColor.whiteColor().CGColor
        crossButton.imageView?.contentMode = .ScaleAspectFit
        crossButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        crossButton.layer.cornerRadius = 8.0
        crossButton.setImage(UIImage(named: "x")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        crossButton.imageView?.tintColor = UIColor.redColor()
        
        checkButton.layer.backgroundColor = UIColor.whiteColor().CGColor
        checkButton.imageView?.contentMode = .ScaleAspectFit
        checkButton.imageEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        checkButton.layer.cornerRadius = 8.0
        checkButton.setImage(UIImage(named: "check")?.imageWithRenderingMode(.AlwaysTemplate), forState: .Normal)
        checkButton.imageView?.tintColor = UIColor(red:0.00, green:0.73, blue:0.36, alpha:1.00)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

extension OnboardingViewController: KolodaViewDataSource, KolodaViewDelegate {
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return 5
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
        let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width - 32.0, height: 260.0))
        view.backgroundColor = UIColor.lightGrayColor()
        let subtitleLabel = UILabel(frame: CGRect(x: 8.0, y: view.frame.height - 21.0, width: view.frame.width, height: 21.0))
        subtitleLabel.text = "American"
        subtitleLabel.textColor = UIColor(white: 1.0, alpha: 0.8)
        subtitleLabel.font = UIFont.systemFontOfSize(14.0)
        view.addSubview(subtitleLabel)
        
        let titleLabel = UILabel(frame: CGRect(x: 8.0, y: subtitleLabel.frame.minY - 36.0, width: view.frame.width, height: 36.0))
        titleLabel.text = "Sportello Restaurant"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont.boldSystemFontOfSize(24.0)
        view.addSubview(titleLabel)
        
        return view
    }
    
    func koloda(koloda: KolodaView, didSwipeCardAtIndex index: UInt, inDirection direction: SwipeResultDirection) {
    }
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
