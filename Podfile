# Uncomment the next line to define a global platform for your project
 platform :ios, '15.5'

workspace 'SampleApp.xcworkspace'
project 'SampleApp.xcodeproj'

inhibit_all_warnings!
use_frameworks!

def ui_pod
  pod 'SwiftLint'
end

def data_pod
  pod 'Alamofire'
  pod 'SwiftLint'
end

target 'SampleApp' do
  data_pod
end

target 'Data' do
  # Provide path for module project file
  project 'Data/Data.project'
  data_pod
end

target 'UI' do
  # Provide path for module project file
  project 'UI/UI.project'
  ui_pod
end
