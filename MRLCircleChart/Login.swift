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
  
  
  @IBOutlet var loginBtn: UIButton!
    
  @IBOutlet var forgotPassword:UIButton!
    
  @IBOutlet var signUp: UIButton!
    
  @IBOutlet var termsAndConditions: UIButton!
    
  @IBOutlet var dontHaveAnAcc: UITextView!
    
  @IBOutlet var iAgreeTo: UITextView!
    
    @IBOutlet var stackView1: UIStackView!
  
  override func viewDidLoad() {
  
    
    
   
    
    username_field.layer.borderWidth = 1.0
    username_field.layer.cornerRadius = 4
    
    let myColor : UIColor = UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1)
    username_field.layer.borderColor = myColor.CGColor
    
    password_field.layer.borderWidth = 1.0
    password_field.layer.cornerRadius = 4
    
    let myColor1 : UIColor = UIColor(red: 179/255, green: 179/255, blue: 179/255, alpha: 1)
    password_field.layer.borderColor = myColor1.CGColor
    
    loginBtn.layer.cornerRadius = 4
    
    
    
    }
  
  @IBAction func loginPressed(sender: AnyObject) {
    
    
    //Do my login here...
    //If login successful:
    let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    self.dismissViewControllerAnimated(true, completion: nil)
    appDelegate.window?.rootViewController = CustomTabBarController()
  }
  
}
    

  

