//
//  SettingsLauncher.swift
//  MRLCircleChart
//
//  Created by parth on 7/19/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class Setting: NSObject {
  let name: String
  let imageName: String
  
  init(name: String, imageName: String) {
    self.name = name
    self.imageName = imageName
  }
}

class SettingsLauncher: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  let blackView = UIView()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = UIColor.whiteColor()
    return cv
  }()
  
  let cellId = "cellId"
  let cellHeight: CGFloat = 50
  
  let settings: [Setting] = {
    return [Setting(name: "Update Profile", imageName: "switch_account"), Setting(name: "Invite With Friends", imageName: "invite"), Setting(name: "Logout", imageName: "logout"), Setting(name: "Cancel", imageName: "cancel")]
  }()
  
  func showSettings() {
    //show menu
    
    if let window = UIApplication.sharedApplication().keyWindow {
      
      blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
      
      blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
      
      window.addSubview(blackView)
      
      window.addSubview(collectionView)
      
      let height: CGFloat = CGFloat(settings.count) * cellHeight
      let y = window.frame.height - height
      collectionView.frame = CGRectMake(0, window.frame.height, window.frame.width, height)
      
      blackView.frame = window.frame
      blackView.alpha = 0
      
      UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
        
        self.blackView.alpha = 1
        
        self.collectionView.frame = CGRectMake(0, y, self.collectionView.frame.width, self.collectionView.frame.height)
        
        }, completion: nil)
    }
  }
  
  
   var controller_FeedController: FeedController?
  var controller_InnerFriendsTimeline : InnerFriendsTimeline?
  var controller_InnerCircle : FriendsController?
  
   var identifier : String?
  func handleDismiss(setting: Setting) {
    UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .CurveEaseOut, animations: {
      
      self.blackView.alpha = 0
      
      if let window = UIApplication.sharedApplication().keyWindow {
        self.collectionView.frame = CGRectMake(0, window.frame.height, self.collectionView.frame.width, self.collectionView.frame.height)
      }
      
    }) { (completed: Bool) in
      if setting.name != "" && setting.name != "Cancel" {
      
        if self.identifier == "FeedController" {
                self.controller_FeedController?.showControllerForSetting(setting)
        }
        
        else if self.identifier == "InnerFriendsTimeline" {
        
               self.controller_InnerFriendsTimeline?.showControllerForSetting(setting)
        
        }
        
        else if self.identifier == "FriendsController" {
          
                self.controller_InnerCircle?.showControllerForSetting(setting)
          
        }
        
      }
    }
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    let setting = self.settings[indexPath.item]
    handleDismiss(setting)
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return settings.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! SettingCell
    
    let setting = settings[indexPath.item]
    cell.setting = setting
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(collectionView.frame.width, cellHeight)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }
  
  override init() {
    super.init()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.registerClass(SettingCell.self, forCellWithReuseIdentifier: cellId)
  }
  
}

