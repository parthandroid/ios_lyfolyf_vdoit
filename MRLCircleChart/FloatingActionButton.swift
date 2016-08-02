//
//  FloatingActionButton.swift
//  MRLCircleChart
//
//  Created by parth on 7/15/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LiquidFloatingActionButton



class FloatingActionButton : UIViewController {
  
static var ref : UINavigationController?

  
var cells = [LiquidFloatingCell]()
var floatingActionButton: LiquidFloatingActionButton!
  
  
  override func viewDidLoad() {
    
    floatingActionButton.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    
  }
  
  func handlePan(recognizer:UIPanGestureRecognizer) {
    
    let translation = recognizer.translationInView(self.view)
    if let view = recognizer.view {
      view.center = CGPoint(x:view.center.x + translation.x,
                            y:view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPointZero, inView: self.view)
  }
  
  
  
  func setUpNav(index : Int){
    
    if index == 0{
    
      let viewcontroller = Test(collectionViewLayout: UICollectionViewFlowLayout())
      
      viewcontroller.hidesBottomBarWhenPushed = true
      
      
      FloatingActionButton.ref?.pushViewController(viewcontroller, animated: true)
      

    }
    
    else if index == 1 {
      
//      let storyboard = UIStoryboard(name: "Main", bundle: nil)
//      var initialViewController = storyboard.instantiateViewControllerWithIdentifier("test") as! UIViewController
//    
//      FloatingActionButton.ref?.pushViewController(initialViewController, animated: true)

    
    }
    
    else if index == 2 {
      
//      FloatingActionButton.ref?.pushViewController(Test(), animated: true)
      
      
    }
    
    else if index == 3 {
      
    FloatingActionButton.ref?.pushViewController(ClapperBoard(), animated: true)
      

      
      
    }
    
  
    
  }
  
  
  func createFloatingButtons(controller : AnyObject){
    
    cells.append(createButtonCell("dash"))
    cells.append(createButtonCell("life_aspect_icon"))
    cells.append(createButtonCell("clapperboard"))
    cells.append(createButtonCell("chess_icon"))
    
    let floatingFrame = CGRect(x: controller.view.frame.width - 56 - 16, y: controller.view.frame.height - 56 - 16 - 50, width: 56, height: 56)
    let floatingButton = createButton(floatingFrame , style : .Left)
    floatingButton.enableShadow = true
    
    
    
    
    controller.view.addSubview(floatingButton)
    self.floatingActionButton = floatingButton
    
  }
  
  func createButtonCell(iconName: String) -> LiquidFloatingCell {
    
    print("called")

    
    return LiquidFloatingCell(icon: UIImage(named: iconName)!)
   
    
  }
  
  
  func createButton(frame: CGRect , style: LiquidFloatingActionButtonAnimateStyle) -> LiquidFloatingActionButton {
    
    let floatingActionButton = LiquidFloatingActionButton(frame: frame)
    
    floatingActionButton.animateStyle = style
    
    floatingActionButton.dataSource = self
    floatingActionButton.delegate = self
    
    return floatingActionButton
    
  }
  

  
}


extension FloatingActionButton : LiquidFloatingActionButtonDataSource {
  
   func numberOfCells(liquidFloatingActionButton: LiquidFloatingActionButton) -> Int {
    
    return cells.count
    
  }
  
   func cellForIndex(index: Int) -> LiquidFloatingCell {
    
    return cells[index]
    
  }
  
}


extension FloatingActionButton : LiquidFloatingActionButtonDelegate {
  
   func liquidFloatingActionButton(liquidFloatingActionButton: LiquidFloatingActionButton, didSelectItemAtIndex index: Int) {
    
         print("button \(index) clicked")
    
         self.floatingActionButton.close()
    
         setUpNav(index)
    
    
    
  }
  
}



