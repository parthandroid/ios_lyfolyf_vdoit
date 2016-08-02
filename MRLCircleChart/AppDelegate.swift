//
//  AppDelegate.swift
//  MRLCircleChart
//
//  Created by mlisik on 03/27/2016.
//  Copyright (c) 2016 mlisik. All rights reserved.
//

import UIKit
import SwiftyUserDefaults


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    
//    let barAppearace = UIBarButtonItem.appearance()
//    barAppearace.setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), forBarMetrics:UIBarMetrics.Default)
    
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    
    window?.rootViewController = CustomTabBarController()
    
    let key = Defaults[.login_key]
    
    if key == "loggedin" {
    
      window?.rootViewController = CustomTabBarController()
    
    }
    else {
      
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

extension DefaultsKeys {
  static let login_key = DefaultsKey<String?>("login_key")
  static let launchCount = DefaultsKey<Int>("launchCount")
}
