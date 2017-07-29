# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'TimeLogger' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  
  # Pods for TimeLogger
  pod 'RxSwift', :inhibit_warnings => true
  pod 'RxCocoa', :inhibit_warnings => true
  pod 'RxAlamofire'
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'KeychainAccess'
  pod 'RealmSwift', :inhibit_warnings => true
  pod 'Action'
  
  
  target 'TimeLoggerTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'RxTest'
    pod 'RxBlocking'
  end
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
      if target.name == 'RxSwift'
        target.build_configurations.each do |config|
          if config.name == 'Debug'
            config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D',
            'TRACE_RESOURCES']
          end
        end
      end
    end
  end
end
