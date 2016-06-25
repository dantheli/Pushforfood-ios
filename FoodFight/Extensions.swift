//
//  Extensions.swift
//  FoodFight
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

extension UIColor {
    static func foodOrange() -> UIColor {
        return UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1.0)
    }
}

extension UIViewController {
    func displayError(error: NSError, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
        presentViewController(alertController, animated: true, completion: nil)
    }
}

extension UINavigationController {
    func setTheme() {
        navigationBar.barTintColor = UIColor.foodOrange()
        navigationBar.tintColor = UIColor.whiteColor()
        navigationBar.barStyle = .Black
    }
}

extension UIView {
    func fadeShow() {
        self.hidden = false
        UIView.animateWithDuration(0.35) {
            self.alpha = 1.0
        }
    }
    
    func fadeHide() {
        UIView.animateWithDuration(0.35, animations: {
            self.alpha = 0.0
        }) { Void in
            self.hidden = true
        }
    }
}