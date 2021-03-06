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
  
  var authenticationService: AuthenticationService!
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let authService = AuthenticationService()
    let sceneCoordinator = SceneCoordinator(window: window!)
    
    print("APIKey info:")
    print("Key: " + APIKey.sharedInstance.value)
    print("ID: \(APIKey.sharedInstance.uniqueID)")
    print("Auth status: \(APIKey.sharedInstance.isAuthentic)")
    
    let loadingViewModel = LoadingViewModel(coordinator: sceneCoordinator, authService: authService)
    
    let firstScene = Scene.loading(loadingViewModel)
    
    sceneCoordinator.transition(to: firstScene, type: .root)
    
    return true
  }
  
}


