//
//  AppDelegate.swift
//  MRLCircleChart
//
//  Created by mlisik on 03/27/2016.
//  Copyright (c) 2016 mlisik. All rights reserved.
//

import UIKit

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    
    window?.rootViewController = CustomTabBarController()
    
    let defaults = NSUserDefaults.standardUserDefaults()
    if defaults.objectForKey("userLoggedIn") == nil{
      showLogin()
    }
    
    return true
  }
  
  
  
  func showLogin() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let loginViewController = storyboard.instantiateViewControllerWithIdentifier("login") as! Login
    self.window?.makeKeyAndVisible()
    self.window?.rootViewController = loginViewController
  }
  
}
