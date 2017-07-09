# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'

target 'TimeLogger' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TimeLogger
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxAlamofire'
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'KeychainAccess'
  pod 'RealmSwift'
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
        end
    end
end
