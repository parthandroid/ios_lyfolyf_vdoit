//
//  Login.swift
//  MRLCircleChart
//
//  Created by parth on 6/27/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyUserDefaults
import SystemConfiguration
import Alamofire
import SwiftyJSON
import PKHUD

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
  
  // function to check network availability
  
  func connectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in()
    
    zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
    
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    guard let defaultRouteReachability = withUnsafePointer(&zeroAddress, {
      SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
    }) else {
      return false
    }
    var flags : SCNetworkReachabilityFlags = []
    
    if SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) == false {
      
      return false
      
    }
    
    let isReachable = flags.contains(.Reachable)
    
    let needsConnection = flags.contains(.ConnectionRequired)
    
    return (isReachable && !needsConnection)
    
  }

  
  
  // invoked when login button is clicked
  
  @IBAction func loginPressed(sender: AnyObject) {
    
//    HUD.show(.Progress)
    
    var user_name  = username_field.text?.trim()
    
    var pass_word = password_field.text?.trim()
    
    
    

    if user_name!.isEmpty || pass_word!.isEmpty {
      
      
      
      let alert = UIAlertController(title: "Alert", message: "All fields are required", preferredStyle: UIAlertControllerStyle.Alert)
      
      // add an action (button)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
      
      // show the alert
      self.presentViewController(alert, animated: true, completion: nil)


    
    
      
    }else {
    
      
      
      
      if !connectedToNetwork() {
      
        
        
        let alert = UIAlertController(title: "Alert", message: "no network", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)

      
      }
      
      else {
        
        PKHUD.sharedHUD.contentView = PKHUDTextView(text: "please wait...")
        PKHUD.sharedHUD.show()
        
      
      Alamofire.request(.GET, "https://www.lyfolyf.com/lol-api/public/user/validate/username/\(user_name!)/password/\(pass_word!)")
        .responseJSON { (response) -> Void in
          
          
          if let value = response.result.value {
            
            let json = JSON(value)
            
            //          let x = (json["response"].dictionary!["docs"]?.array![0].dictionary!["user_id"])!
            
            let x = json["errors"].string
            
            if x == "Invalid credentials"{
              
              print("invalid cred")
              
              HUD.flash(.Error, delay: 1.0)
              
            }else {
              
              
              HUD.flash(.Success, delay: 0.3) { finished in
                
                
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                self.dismissViewControllerAnimated(true, completion: nil)
                appDelegate.window?.rootViewController = CustomTabBarController()
                
                Defaults[.login_key] = "loggedin"
                
                
                
              }
            }
          }
        }
      }
    }
  }
}


// extension for trimming widespaces

extension String
{
  func trim() -> String
  {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
  }
}




