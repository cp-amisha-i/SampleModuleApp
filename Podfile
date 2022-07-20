# Uncomment the next line to define a global platform for your project
 platform :ios, '15.5'

workspace 'SampleApp.xcworkspace'
project 'SampleApp.xcodeproj'

inhibit_all_warnings!
use_frameworks!

target 'SampleApp' do
  pod 'Alamofire'
  pod 'SwiftLint'
end

target 'Data' do
  # Provide path for module project file
  project 'Data/Data.project'

  pod 'Alamofire'
  pod 'SwiftLint'
end

target 'UI' do
  # Provide path for module project file
  project 'UI/UI.project'

  pod 'SwiftLint'
end
