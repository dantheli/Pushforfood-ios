//
//  AppDelegate.swift
//  Food
//
//  Created by Daniel Li on 6/24/16.
//  Copyright © 2016 MEDJI. All rights reserved.
//

import UIKit

var played = false

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard: UIStoryboard?

    var OneSignalAppId = "1511941a-fe53-4854-87ed-62dbfba5ec0e"
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        _ = OneSignal(launchOptions: launchOptions, appId: OneSignalAppId, handleNotification: nil, autoRegister: false)
        
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if SessionCode == nil {
            window.rootViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
        } else {
            presentMainView()
        }
        
        window.makeKeyAndVisible()
        self.window = window
        self.storyboard = storyboard
        
        UITabBar.appearance().tintColor = UIColor.foodOrange()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(userSignedIn), name: "UserSignedIn", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(presentMainView), name: "MainMenu", object: nil)
        
        return true
    }
    
    func userSignedIn() {
        presentMainView()
    }
    
    func userSignedOut() {
        presentLogin()
    }
    
    func presentLogin() {
        window?.rootViewController = storyboard?.instantiateViewControllerWithIdentifier("LoginViewController")
    }
    
    func presentMainView() {
        let tabbarController = storyboard?.instantiateViewControllerWithIdentifier("TabBarController")
        window?.rootViewController = tabbarController
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        if played {
            window?.rootViewController?.presentViewController(FeedbackViewController(), animated: true, completion: nil)
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

