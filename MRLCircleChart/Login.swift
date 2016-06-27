//
//  Login.swift
//  MRLCircleChart
//
//  Created by parth on 6/27/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

class Login: UIViewController {

  @IBOutlet var username_field: UITextField!
  
  @IBOutlet var password_field: UITextField!
  
  override func viewDidLoad() {
  
    
  }
  
  @IBAction func loginPressed(sender: AnyObject) {
    
    
    
    // for the time being
    if username_field.text == "part" && password_field.text == "parth"{
    
    performSegueWithIdentifier("login", sender: nil)
      
    }
    
  }
  

}
