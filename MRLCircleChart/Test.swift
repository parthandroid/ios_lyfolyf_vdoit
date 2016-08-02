//
//  Test.swift
//  MRLCircleChart
//
//  Created by parth on 7/15/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Charts

class Test: UICollectionViewController , UICollectionViewDelegateFlowLayout  {

  let cellIdentifier = "cellIdentifier"

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
     navigationItem.title = "Dashboard"
    
    collectionView?.alwaysBounceVertical = true
    
    collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 0)
    
    collectionView?.registerClass(FeedCell_Dashboard.self, forCellWithReuseIdentifier: cellIdentifier)
    
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
      UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
      image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
      let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      return newImage
    }
    
    view.backgroundColor = UIColor(patternImage: imageWithImage(UIImage(named: "collage")!, scaledToSize: CGSize(width: view.frame.width+150, height: view.frame.height)))
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
    
  }
  
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    
    FeedCell_Dashboard.cell_num = indexPath.item
    
    print(indexPath.item)
    
    
    
    let feedCell_Dashboard = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! FeedCell_Dashboard
    
    return feedCell_Dashboard
  }
  
  
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    if indexPath.item == 0 {
      return CGSizeMake(view.frame.width, 300)
      
    }
      
    else if indexPath.item == 1 {
      return CGSizeMake(view.frame.width, 200)
      
    }
      
    else {
      return CGSizeMake(view.frame.width, 200)
      
      
    }
    
  }


  
}



class FeedCell_Dashboard : UICollectionViewCell , ChartViewDelegate {
  
  
  let months = ["red", "green", "yellow"]
  let unitsSold = [30.0, 30.0, 40.0]
  
  let months_forcast = ["red", "green", "yellow"]
  let unitsSold_forcast = [50.0, 30.0, 20.0]
  
  let months_real = ["red", "green", "yellow"]
  let unitsSold_real = [70.0, 15.0, 15.0]
  
  func setChart(dataPoints: [String], values: [Double] , H_Constraint : String , V_Constraint : String , x_constant : CGFloat , y_constant : CGFloat) {
    
    
    let pieChartView : PieChartView = {
      
      let pie = PieChartView()
      
      return pie
      
    }()
    
    
    
    addSubview(pieChartView)
    
    addConstraintWithFormat(H_Constraint, views: pieChartView)
    addConstraintWithFormat(V_Constraint, views: pieChartView)
    
    addConstraint(NSLayoutConstraint(item: pieChartView, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: x_constant))
    
    addConstraint(NSLayoutConstraint(item: pieChartView, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: y_constant))

    
//    pieChartView.centerText = "Real Happiness"
    
    pieChartView.drawSliceTextEnabled = false
    
    
    
    //    pieChartView.highlightPerTapEnabled = false
    
    var dataEntries: [ChartDataEntry] = []
    
    for i in 0..<dataPoints.count {
      let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
      dataEntries.append(dataEntry)
    }
    
    let pieChartDataSet = PieChartDataSet(yVals: dataEntries, label: "Units Sold")
    let pieChartData = PieChartData(xVals: dataPoints, dataSet: pieChartDataSet)
    pieChartView.data = pieChartData
    
    var colors: [UIColor] = []
    
    
    let color_red = UIColor.rgb(213, green: 0, blue: 0)

    let color_yellow = UIColor.rgb(255, green: 214, blue: 0)

    let color_green = UIColor.rgb(100, green: 221, blue: 23)



    
      colors.append(color_red)
      colors.append(color_green)
      colors.append(color_yellow)
   
    
    
    pieChartDataSet.colors = colors
    
    pieChartView.legend.enabled = false
    
    pieChartView.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: ChartEasingOption.EaseOutBack)
    
    pieChartView.delegate = self
    
//    EaseOutBack
    
    
  }

  func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
    
    print(highlight.xIndex)
  
  
  }

  
  static var cell_num : Int?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    if FeedCell_Dashboard.cell_num == 0 {
      setUpViews1()
    }
      
    else if FeedCell_Dashboard.cell_num == 1 {
      
      setUpViews2()
      
    }
      
    else if FeedCell_Dashboard.cell_num == 2 {
      
      setUpViews3()
      
      
    }
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  
  
  func setUpViews1(){
    
    
    backgroundColor = UIColor(white: 1, alpha: 0.85)
    
    setChart(months, values: unitsSold , H_Constraint: "H:[v0(250)]" , V_Constraint: "V:[v0(250)]" , x_constant: 0 , y_constant: 20 )

    

    
  }
  
  
  func setUpViews2(){
    
    backgroundColor = UIColor(white: 1, alpha: 0.85)
    
    var x = frame.width/4
    
    setChart(months_forcast, values: unitsSold_forcast , H_Constraint: "H:[v0(175)]" , V_Constraint: "V:[v0(175)]" , x_constant: -x , y_constant: 0 )
    
    setChart(months_real, values: unitsSold_real , H_Constraint: "H:[v0(175)]" , V_Constraint: "V:[v0(175)]" , x_constant: +x , y_constant: 0 )
    
    
  }
  
  
  func setUpViews3(){
    
    backgroundColor = UIColor(white: 1, alpha: 0.85)
    
    
  }
  
  
  
  
}






