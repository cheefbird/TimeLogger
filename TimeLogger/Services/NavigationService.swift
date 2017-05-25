//
//  NavigationService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import UIKit

class NavigationService {
  
  // MARK: - Properties
  var authenticationService = AuthenticationService()
  
  // MARK: - Static Properties
  static let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
  
  
  // MARK: - Computed Properties
  lazy var loginViewController: LoginViewController = {
    
    let loginVC = NavigationService.mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    
    return loginVC
    
  }()
  
  
  lazy var successfulLoginViewController: SuccessfulLoginViewController = {
    
    let tabController = NavigationService.mainStoryboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
    
    let successVC = tabController.viewControllers?[0] as! SuccessfulLoginViewController
    
    return successVC
    
  }()
  
  
  func rootViewController() -> UIViewController {
    
    switch authenticationService.apiKey.isValid {
      
    case true:
      let vc = successfulLoginViewController
      vc.authenticationService = authenticationService
      return vc
      
    case false:
      let viewModel = LoginViewModel(navigationService: self, authenticationService: authenticationService)
      let vc = loginViewController
      vc.viewModel = viewModel
      
      return vc
    }
    
  }
  
  
  
  // This should become an observable
  func postAuthentication() {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let vc = rootViewController()
    
    appDelegate.window?.rootViewController = vc
    
    appDelegate.window?.makeKeyAndVisible()
    
  }
  
}

extension NavigationService {
  

  
}
