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
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    
    
    let authService = AuthenticationService()
    let projectService = ProjectService()
    let sceneCoordinator = SceneCoordinator(window: window!)
    
//    let loadingViewModel = LoadingViewModel(coordinator: sceneCoordinator, authService: authService)
    let projectsViewModel = ProjectsViewModel(
      sceneCoordinator: sceneCoordinator,
      projectService: projectService,
      authenticationService: authService)
    
    let firstScene = Scene.fistTabBarLoad(projectsViewModel)
    
    sceneCoordinator.transition(to: firstScene, type: .root)
    
    return true
  }
  
}


