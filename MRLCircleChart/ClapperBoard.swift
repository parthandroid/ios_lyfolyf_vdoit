//
//  ClapperBoard.swift
//  MRLCircleChart
//
//  Created by parth on 8/1/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Device

class ClapperBoard: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
      view.backgroundColor = UIColor.whiteColor()

      let x = view.frame.width/2
      let y = view.frame.height/2
      
     
      // lower clamp
      let view1 = UIView(frame: CGRectMake(x, y, 200, 50))
      view1.backgroundColor = UIColor.rgb(255, green: 214, blue: 0)
      view1.rotate(angle: 0)
      
      
      // upper clamp
      let view2 = UIView(frame: CGRectMake(x, y, 200, 50))
      view2.backgroundColor = UIColor.rgb(255, green: 23, blue: 68)
      view2.rotate(angle: -11.5)
      
      
      
      let clapperImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clapper1")
        imageView.contentMode = .ScaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.userInteractionEnabled = true
        return imageView
        
      }()

      
      let containerview = UIView()
//      containerview.backgroundColor = UIColor.blueColor()
      view.addSubview(containerview)
      
      
      
      let post_screen : UIButton = {
        
        let button = UIButton()
        button.setTitle("What's new?", forState: .Normal)
        button.setTitleColor(UIColor.rgb(97, green: 97, blue: 97), forState: .Normal)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 160)
        button.backgroundColor = UIColor.init(white: 1, alpha: 1)
        button.titleLabel?.font = UIFont.systemFontOfSize(14)
        button.layer.cornerRadius = 1
        return button
        
      }()
      
      
      let circle_button : UIButton = {
        
        let button = UIButton()
        button.backgroundColor = UIColor.rgb(255, green: 23, blue: 68)
        button.layer.cornerRadius = 8
        return button
        
      }()

      
      containerview.addSubview(view1)
      containerview.addSubview(view2)
      containerview.addSubview(clapperImage)
      containerview.addSubview(post_screen)
      
      
      containerview.addSubview(circle_button)
      
      

      
      ///// view1 ////
      
      containerview.addConstraintsWithFormat("H:[v0(300)]", views: view1)
      containerview.addConstraintsWithFormat("V:[v0(44)]", views: view1)
      
      containerview.addConstraint(NSLayoutConstraint(item: view1, attribute: .CenterY, relatedBy: .Equal, toItem: containerview, attribute: .CenterY, multiplier: 1, constant: -47))
      
      containerview.addConstraint(NSLayoutConstraint(item: view1, attribute: .CenterX, relatedBy: .Equal, toItem: containerview, attribute: .CenterX, multiplier: 1, constant: 0))
      
      
      ///// view2 ////
      
      containerview.addConstraintsWithFormat("H:[v0(280)]", views: view2)
      containerview.addConstraintsWithFormat("V:[v0(44)]", views: view2)
      
      containerview.addConstraint(NSLayoutConstraint(item: view2, attribute: .CenterY, relatedBy: .Equal, toItem: containerview, attribute: .CenterY, multiplier: 1, constant: -120))
      
      containerview.addConstraint(NSLayoutConstraint(item: view2, attribute: .CenterX, relatedBy: .Equal, toItem: containerview, attribute: .CenterX, multiplier: 1, constant: 0))
      
      
      //// clapper image ////
      
      containerview.addConstraintsWithFormat("H:[v0(500)]", views: clapperImage)
      containerview.addConstraintsWithFormat("V:[v0(500)]", views: clapperImage)
      
      containerview.addConstraint(NSLayoutConstraint(item: clapperImage, attribute: .CenterY, relatedBy: .Equal, toItem: containerview, attribute: .CenterY, multiplier: 1, constant: 0))
      
      containerview.addConstraint(NSLayoutConstraint(item: clapperImage, attribute: .CenterX, relatedBy: .Equal, toItem: containerview, attribute: .CenterX, multiplier: 1, constant: 0))
      
      
      //// what's neew button ////
      
      containerview.addConstraintsWithFormat("H:[v0(270)]", views: post_screen)
      containerview.addConstraintsWithFormat("V:[v0(40)]", views: post_screen)
      
      containerview.addConstraint(NSLayoutConstraint(item: post_screen, attribute: .CenterY, relatedBy: .Equal, toItem: containerview, attribute: .CenterY, multiplier: 1, constant: 10))
      
      containerview.addConstraint(NSLayoutConstraint(item: post_screen, attribute: .CenterX, relatedBy: .Equal, toItem: containerview, attribute: .CenterX, multiplier: 1, constant: 0))
      
      
      
      //// circle button ////
      
      
      containerview.addConstraintsWithFormat("H:[v0(16)]", views: circle_button)
      containerview.addConstraintsWithFormat("V:[v0(16)]", views: circle_button)
      
      containerview.addConstraint(NSLayoutConstraint(item: circle_button, attribute: .CenterY, relatedBy: .Equal, toItem: containerview, attribute: .CenterY, multiplier: 1, constant: -45))
      
      containerview.addConstraint(NSLayoutConstraint(item: circle_button, attribute: .CenterX, relatedBy: .Equal, toItem: containerview, attribute: .CenterX, multiplier: 1, constant: -10))
      
      
      
      //// container view ////
      
      view.addConstraintsWithFormat("H:[v0(500)]", views: containerview)
      view.addConstraintsWithFormat("V:[v0(500)]", views: containerview)
      
      view.addConstraint(NSLayoutConstraint(item: containerview, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 100))
      
      view.addConstraint(NSLayoutConstraint(item: containerview, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
      
      
      
      
  }
  
  
  

}


extension UIView {
  
  /**
   Rotate a view by specified degrees
   
   - parameter angle: angle in degrees
   */
  func rotate(angle angle: CGFloat) {
    let radians = angle / 180.0 * CGFloat(M_PI)
    let rotation = CGAffineTransformRotate(self.transform, radians);
    self.transform = rotation
  }
  
}
