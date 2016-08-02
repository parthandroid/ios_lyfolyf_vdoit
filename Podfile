source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'MRLCircleChart_Example' do
  pod 'MRLCircleChart', path: '../'
  pod 'Canvas'
  pod 'LiquidFloatingActionButton', :git => 'https://github.com/yoavlt/LiquidFloatingActionButton.git', :branch => 'swift-2.0'
  pod 'Charts'
  pod 'SwiftyUserDefaults'
  pod 'Alamofire', '~> 3.4'
  pod 'SwiftyJSON'
  pod 'PKHUD'
  pod 'Device', '~> 1.0.1'
end

target 'MRLCircleChart_Tests' do
  pod 'MRLCircleChart', path: '../'
  pod 'Canvas'
 
end

post_install do |installer|
  main_group = installer.pods_project.root_object.main_group
  spacing = '2'
  puts("Sets indent_width to `#{spacing}` for Pods project")
  main_group.indent_width = spacing
  puts("Sets tab_width to `#{spacing}` for Pods project")
  main_group.tab_width = spacing
end
