source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'MRLCircleChart_Example' do
  pod 'MRLCircleChart', path: '../'
end

target 'MRLCircleChart_Tests' do
  pod 'MRLCircleChart', path: '../'
end

post_install do |installer|
  main_group = installer.pods_project.root_object.main_group
  spacing = '2'
  puts("Sets indent_width to `#{spacing}` for Pods project")
  main_group.indent_width = spacing
  puts("Sets tab_width to `#{spacing}` for Pods project")
  main_group.tab_width = spacing
end
