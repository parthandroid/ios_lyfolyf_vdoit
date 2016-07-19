//
//  CustomTabBarController.swift
//  MRLCircleChart
//
//  Created by parth on 7/12/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UITabBar.appearance().tintColor = UIColor.rgb(70, green: 146, blue: 250)

    
    let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
    let navigationController = UINavigationController(rootViewController: feedController)
    navigationController.navigationBar.barTintColor = UIColor.rgb(33, green: 150, blue: 243)
    navigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    navigationController.title = nil
    navigationController.tabBarItem.image = UIImage(named : "timeline")
    
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    var initialViewController = storyboard.instantiateViewControllerWithIdentifier("ViewController") as! UIViewController
    
    let innerTimeline = InnerFriendsTimeline(collectionViewLayout: UICollectionViewFlowLayout())
    innerTimeline.navigationItem.title = "Inner Circle Timeline"
    let secondNavigationController = UINavigationController(rootViewController : innerTimeline)
    secondNavigationController.navigationBar.barTintColor = UIColor.rgb(33, green: 150, blue: 243)
    secondNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    secondNavigationController.title = nil
    secondNavigationController.tabBarItem.image = UIImage(named : "inner_circle_timeline")
    
    
    let innerCircle = FriendsController(collectionViewLayout : UICollectionViewFlowLayout())
    innerCircle.navigationItem.title = "Inner Circle Friends"
    let thirdNavigationController = UINavigationController(rootViewController : innerCircle)
    thirdNavigationController.navigationBar.barTintColor = UIColor.rgb(33, green: 150, blue: 243)
    thirdNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    thirdNavigationController.title = nil
    thirdNavigationController.tabBarItem.image = UIImage(named : "inner_circle")
    
    
    let notifications = UIViewController()
    notifications.navigationItem.title = "Notifications"
    let fourthNavigationController = UINavigationController(rootViewController : notifications)
    fourthNavigationController.navigationBar.barTintColor = UIColor.rgb(33, green: 150, blue: 243)
    fourthNavigationController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
    fourthNavigationController.title = nil
    fourthNavigationController.tabBarItem.image = UIImage(named : "notification")
    
    
    viewControllers = [navigationController , secondNavigationController ,thirdNavigationController , fourthNavigationController]
    
    
    tabBar.translucent = false
    
    let topBorder = CALayer()
    topBorder.frame = CGRectMake(0, 0, 1000, 0.5)
    topBorder.backgroundColor = UIColor.rgb(229, green: 231, blue: 235).CGColor
    
    tabBar.layer.addSublayer(topBorder)
    tabBar.clipsToBounds = true
    
  }
  
  
}