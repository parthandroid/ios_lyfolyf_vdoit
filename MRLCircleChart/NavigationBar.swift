//
//  NavigationBar.swift
//  MRLCircleChart
//
//  Created by parth on 6/25/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationItem {

  
  override func awakeFromNib() {
    // color of navi bar
    UINavigationBar.appearance().barTintColor = UIColor.init(red: 33/255, green: 150/255, blue: 243/255, alpha: 1)
    // color of text on navi bar
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    // color of back button
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
  
  }
  
}
