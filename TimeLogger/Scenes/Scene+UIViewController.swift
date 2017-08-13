//
//  Scene+UIViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


extension Scene {
  
  func viewController() -> UIViewController {
    
    switch self {
      
    case .loading(let viewModel):
      var viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoadingViewController") as! LoadingViewController
      viewController.bindViewModel(using: viewModel)
      return viewController
      
    case .login(let viewModel):
      var viewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
      viewController.bindViewModel(using: viewModel)
      return viewController
      
    case .mainTabBar(_):
      let tabBarController = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
      
      tabBarController.selectedIndex = 0
      
      
      return tabBarController
      
    case .fistTabBarLoad(let viewModel):
      let tabController = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarConroller") as! UITabBarController
      var projectsViewController = tabController.selectedViewController?.navigationController?.viewControllers.first as! ProjectsViewController
      
      projectsViewController.bindViewModel(using: viewModel)
      
      return projectsViewController
      
    }
  }
}
