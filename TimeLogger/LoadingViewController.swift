//
//  LoadingViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/4/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  
  
  // MARK: - Properties
  var authenticationService: AuthenticationService!
  var delegate: AppDelegate!
  
  
  
  // MARK: - View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // start spinner
    activityIndicator.isHidden = false
    activityIndicator.startAnimating()
    statusLabel.text = "Checking for authenticated user..."
    guard authenticationService.hasAuthenticated else {
      
      statusLabel.text = "You haven't logged in yet. Taking you to login..."
      
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
        
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.showLoginController()

      }
      
      return
    }
    
    statusLabel.text = "Found authenticated user! Logging in..."
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
      
      self.activityIndicator.stopAnimating()
      self.activityIndicator.isHidden = true
      self.showTabController()
      
    }
    
  }
  
  
  // MARK: - Methods
  
  private func showTabController() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
    
    tabController.selectedIndex = 0
    delegate.window?.rootViewController = tabController
    delegate.window?.makeKey()
    
  }
  
  private func showLoginController() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    
    loginController.authenticationService = authenticationService
    loginController.appDelegate = delegate
    
    delegate.window?.rootViewController = loginController
    delegate.window?.makeKeyAndVisible()
    
  }
  
  private func animateRootControllerTransition() {
    
    
    
  }
  
}


// MARK: - Action Delay
extension LoadingViewController {
  
  fileprivate func checkAuthenticationStatus(completion: (Bool) -> Void) {
    completion(authenticationService.hasAuthenticated)
  }
  
}





