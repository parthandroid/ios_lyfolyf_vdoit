//
//  Test.swift
//  MRLCircleChart
//
//  Created by parth on 7/15/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import Charts

class Test: UIViewController , ChartViewDelegate {

//  @IBOutlet var lineChartView: LineChartView!
//  @IBOutlet var pieChartView: PieChartView!
    
    @IBOutlet var pieChartView: PieChartView!
    
    @IBOutlet var lineChartView: LineChartView!
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    let months = ["red", "green", "yellow"]
    let unitsSold = [30.0, 30.0, 40.0]
    
    setChart(months, values: unitsSold)

  
  }
  
  
  
  func setChart(dataPoints: [String], values: [Double]) {
    
    pieChartView.centerText = "Real Happiness"
    
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
    
    for i in 0..<dataPoints.count {
      let red = Double(arc4random_uniform(256))
      let green = Double(arc4random_uniform(256))
      let blue = Double(arc4random_uniform(256))
      
      let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
      colors.append(color)
    }
    
    pieChartDataSet.colors = colors
    

    
    
    let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
    let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
    lineChartView.data = lineChartData
    
    
  
  }
  
  func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
    
    
  }
  
  
  
  
  
  
}
