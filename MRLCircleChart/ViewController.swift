//
//  ViewController.swift
//  MRLCircleChart
//
//  Created by mlisik on 27/03/2016.
// 
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

//import UIKit
//import MRLCircleChart
//
//struct Data {
//  static let maxValue: Double = 100
//  static let values: [Double] = [30,20 ,50]
//  
//  // forcast
//  static let maxValue_forcast: Double = 100
//  static let values_forcast: [Double] = [10, 50, 40]
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
//class ViewController: UIViewController {
//  
//  @IBOutlet var chart: MRLCircleChart.Chart?
//  
//  //forcast
//  @IBOutlet var chart_forcast: MRLCircleChart.Chart?
//  
//  //real
//  @IBOutlet var chart_real: MRLCircleChart.Chart?
//
//  
//  var dataSource = DataSource(items: [], maxValue: Data.maxValue)
//  
//  //forcast
//  var dataSource_forcast = DataSource(items: [], maxValue: Data.maxValue)
//  
//  //real
//  var dataSource_real = DataSource(items: [], maxValue: Data.maxValue)
//  
//  
//  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    
//    setupData()
//    setupData_forcast()
//    setupData_real()
//    
//    if let tempChart = chart {
//      tempChart.dataSource = dataSource
//      tempChart.selectionStyle = .Grow
//      tempChart.selectHandler = {
//        index in print("selected \(index)")
//        
//        self.sliceSelect(index)
//        
//      }
//      
//        func runAfter(time: Double, block: () -> ()) {
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue(), { 
//          block()
//        })
//      }
//        
//      runAfter(1) {
//        tempChart.reloadData()
//      }
//
//      runAfter(2) {
//        tempChart.select(index: 1)
//      }
//    }
//    
//    
//    //forcast
//    if let tempChart = chart_forcast {
//      tempChart.dataSource = dataSource_forcast
//      tempChart.selectionStyle = .Grow
//      tempChart.selectHandler = {
//        index in print("selected \(index)")
//        
//        
//        //self.sliceSelect(index)
//        
//      }
//      
//      
//      
//      func runAfter(time: Double, block: () -> ()) {
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue(), {
//          block()
//        })
//      }
//      
//      runAfter(1) {
//        tempChart.reloadData()
//      }
//      
//      runAfter(2) {
//        tempChart.select(index: 1)
//      }
//    }
//
//    
//    //real
//    if let tempChart = chart_real {
//      tempChart.dataSource = dataSource_real
//      tempChart.selectionStyle = .Grow
//      tempChart.selectHandler = {
//        index in print("selected \(index)")
//        
//        
//        //self.sliceSelect(index)
//        
//      }
//      
//      
//      
//      func runAfter(time: Double, block: () -> ()) {
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue(), {
//          block()
//        })
//      }
//      
//      runAfter(1) {
//        tempChart.reloadData()
//      }
//      
//      runAfter(2) {
//        tempChart.select(index: 1)
//      }
//    }
//
//    
//    
//    
//  }
//  
//  
//  
//  
//  
//  
// 
//  func sliceSelect(index : Int){
//  
////    let layout = UICollectionViewFlowLayout()
////    let feedController = FeedController(collectionViewLayout : layout)
////    
////    navigationController?.pushViewController(CustomTabBarController(), animated: true)
//
//    
//    //self.performSegueWithIdentifier("goto", sender: nil)
//
//    
//  }
//  
//  
//  private func setupData() {
//    dataSource.chartSegments = Data.values.map { (value: Double) -> MRLCircleChart.Segment in
//      return MRLCircleChart.Segment(value: value, description: "value: \(value)")
//    }.sort { $0 < $1 }
//  }
//  
//  
//  //forcast
//  private func setupData_forcast() {
//    dataSource_forcast.chartSegments = Data.values_forcast.map { (value: Double) -> MRLCircleChart.Segment in
//      return MRLCircleChart.Segment(value: value, description: "value: \(value)")
//      }.sort { $0 < $1 }
//  }
//  
//  //forcast
//  private func setupData_real() {
//    dataSource_real.chartSegments = Data.values_real.map { (value: Double) -> MRLCircleChart.Segment in
//      return MRLCircleChart.Segment(value: value, description: "value: \(value)")
//      }.sort { $0 < $1 }
//  }
//
//  
//  //MARK: - Actions
//  
// }