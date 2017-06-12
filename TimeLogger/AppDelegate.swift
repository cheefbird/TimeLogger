//
//  AppDelegate.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/1/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var authenticationService: AuthenticationService!
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    authenticationService = AuthenticationService()
    
    guard let loadingViewController = window?.rootViewController as? LoadingViewController else {
      return true
    }
    
    loadingViewController.authenticationService = authenticationService
    
    return true
  }
  
}

