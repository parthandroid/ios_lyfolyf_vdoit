//
//  DashboardTest.swift
//  MRLCircleChart
//
//  Created by parth on 7/20/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//
//
//import UIKit
//import MRLCircleChart
//
//let cellIdentifier = "cellIdentifier"
//
//struct Data {
//  static var maxValue: Double = 100
//  static var values: [Double] = [20,20,60]
//  
//  // forcast
//  static let maxValue_forcast: Double = 100
//  static var values_forcast: [Double] = [10, 50, 40]
//  
//  // real
//  static let maxValue_real: Double = 100
//  static let values_real: [Double] = [30, 30, 40]
//  
//  
//  
//}
//
//class DataSource: MRLCircleChart.DataSource {
//  var chartSegments: [MRLCircleChart.Segment]
//  var maxValue: Double
//  
//  init(items: [MRLCircleChart.Segment], maxValue: Double) {
//    self.chartSegments = items
//    self.maxValue = maxValue
//  }
//}
//
//
//
//
//class ViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
//  
//  var refe : MRLCircleChart.Chart?
//  
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//
//    
//    navigationItem.title = "Dashboard"
//    
//    collectionView?.alwaysBounceVertical = true
//    
//    collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
//    
//    collectionView?.registerClass(FeedCell_Dashboard.self, forCellWithReuseIdentifier: cellIdentifier)
//    
//    
//     
//    
//    let fromButton : UIButton = {
//      
//      let button = UIButton()
//      button.setTitle("From", forState: .Normal)
//      button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//      button.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
//      button.layer.borderWidth = 2
//      button.layer.borderColor = UIColor.whiteColor().CGColor
//      button.layer.cornerRadius = 5
//      button.addTarget(self, action: #selector(fromClicked), forControlEvents: .TouchUpInside)
//
//      return button
//      
//    }()
//    
//    let toButton : UIButton = {
//      
//      let button = UIButton()
//      button.setTitle("To", forState: .Normal)
//      button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//
//      button.titleLabel?.font = UIFont.boldSystemFontOfSize(15)
//      button.layer.borderWidth = 2
//      button.layer.borderColor = UIColor.whiteColor().CGColor
//      button.layer.cornerRadius = 5
//      button.addTarget(self, action: #selector(toClicked), forControlEvents: .TouchUpInside)
//
//      return button
//      
//    }()
//    
//    let okButton : UIButton = {
//      
//      let button = UIButton()
//      button.setTitle("OK", forState: .Normal)
//      button.backgroundColor = UIColor.whiteColor()
//      button.setTitleColor(UIColor.rgb(33, green: 150, blue: 243), forState: .Normal)
//      button.titleLabel?.font = UIFont.boldSystemFontOfSize(14)
//      button.layer.cornerRadius = 5
//      
//      button.addTarget(self, action: #selector(okClicked), forControlEvents: .TouchUpInside)
//
//      return button
//      
//    }()
//
//
//
//    
//    
//   
//    
//    let containerView = UIView()
//    containerView.backgroundColor = UIColor.rgb(85, green: 174, blue: 246)
//    containerView.layer.cornerRadius = 5
//    view.addSubview(containerView)
//    view.addConstraintsWithFormat("H:|-5-[v0]-5-|", views: containerView)
//    view.addConstraintsWithFormat("V:|-70-[v0(50)]|", views: containerView)
//
//    
//    containerView.addSubview(fromButton)
//    containerView.addSubview(toButton)
//    containerView.addSubview(okButton)
//
//    
//    
//    containerView.addConstraintsWithFormat("H:[v0(70)][v1(50)][v2(50)]", views: fromButton , toButton, okButton)
//    containerView.addConstraintWithFormat("V:[v0(30)]", views: fromButton)
//    containerView.addConstraintWithFormat("V:[v0(30)]", views: toButton)
//    containerView.addConstraintWithFormat("V:[v0(30)]", views: okButton)
//
//    
//    containerView.addConstraint(NSLayoutConstraint(item: fromButton, attribute: .CenterY, relatedBy: .Equal, toItem: containerView, attribute: .CenterY, multiplier: 1, constant: 0))
//    containerView.addConstraint(NSLayoutConstraint(item: toButton, attribute: .CenterY, relatedBy: .Equal, toItem: containerView, attribute: .CenterY, multiplier: 1, constant: 0))
//    containerView.addConstraint(NSLayoutConstraint(item: okButton, attribute: .CenterY, relatedBy: .Equal, toItem: containerView, attribute: .CenterY, multiplier: 1, constant: 0))
//    
//    containerView.addConstraint(NSLayoutConstraint(item: fromButton, attribute: .CenterX, relatedBy: .Equal, toItem: containerView, attribute: .CenterX, multiplier: 1, constant: -100))
//    containerView.addConstraint(NSLayoutConstraint(item: toButton, attribute: .CenterX, relatedBy: .Equal, toItem: containerView, attribute: .CenterX, multiplier: 1, constant: 0))
//    containerView.addConstraint(NSLayoutConstraint(item: okButton, attribute: .CenterX, relatedBy: .Equal, toItem: containerView, attribute: .CenterX, multiplier: 1, constant: 100))
//
//    
//  }
//  
//  
//  func fromClicked() {
//    DatePickerDialog().show("From", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .Date) {
//      (date) -> Void in
////      self.ViewController.text = "\(date)"
//
//    }
//  
//  
//  }
//  
//  func toClicked() {
//    DatePickerDialog().show("To", doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .Date) {
//      (date) -> Void in
////      self.textField.text = "\(date)"
//    }
//    
//    
//  }
//  
//  func okClicked() {
//    
//    
//    let obj = FeedCell_Dashboard()
//    
//    obj.setUpViews1()
//    
//  }
//  
//  
//  
//  
//  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 3
//  }
//  
//  
//  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//   
//    
//    FeedCell_Dashboard.cell_num = indexPath.item
//    
//    print(indexPath.item)
//    
//    
//    
//    let feedCell_Dashboard = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! FeedCell_Dashboard
//    
//        return feedCell_Dashboard
//  }
//  
//  
//  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//    
//    if indexPath.item == 0 {
//    return CGSizeMake(view.frame.width, 300)
//  
//    }
//    
//    else if indexPath.item == 1 {
//      return CGSizeMake(view.frame.width, 200)
//    
//    }
//    
//    else {
//      return CGSizeMake(view.frame.width, 200)
//
//    
//    }
//    
//  }
//  
//}
//
//
//class FeedCell_Dashboard : UICollectionViewCell {
//  
//  
//  static var cell_num : Int?
//  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//   
//    if FeedCell_Dashboard.cell_num == 0 {
//      setUpViews1()
//    }
//      
//    else if FeedCell_Dashboard.cell_num == 1 {
//      
//      setUpViews2()
//      
//    }
//      
//    else if FeedCell_Dashboard.cell_num == 2 {
//      
//      setUpViews3()
//      
//      
//    }
//    
//  }
//  
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//  
//  
//  
//  
//  
//  func setUpViews1(){
//  
//  
//    backgroundColor = UIColor.redColor()
//      
//  }
//  
//  
//  func setUpViews2(){
//    
//    backgroundColor = UIColor.blueColor()
//
//    
//  }
//  
//  
//   func setUpViews3(){
//    
//    backgroundColor = UIColor.yellowColor()
//
//    
//  }
//  
//  
//  
//  
//}
