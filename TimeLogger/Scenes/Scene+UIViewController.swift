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
      
    case .projects(_):
      let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
      viewController.selectedIndex = 0
      
      return viewController
      
    }
  }
}
