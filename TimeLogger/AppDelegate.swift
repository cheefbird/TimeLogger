//
//  AppDelegate.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/1/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var navigationService = NavigationService()  
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let rootVC = navigationService.rootViewController()
    
    window?.rootViewController = rootVC
    
    window?.makeKeyAndVisible()
    
    return true
  }

  
}

