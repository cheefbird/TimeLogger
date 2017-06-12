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
  
  
  // MARK: - View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // start spinner
    activityIndicator.isHidden = false
    activityIndicator.startAnimating()
    statusLabel.text = "Checking for authenticated user..."
    
    // Check auth status and handle result
    let userHasAuthenticated = authenticationService.hasAuthenticated
    handleAuthenticationStatus(using: userHasAuthenticated)
    
  }

  
  // MARK: - Debug Helper
  #if DEBUG
  deinit {
    print("LoadingView deinitialized!")
  }
  #else
  deinit {
  
  }
  #endif
  
  
  
  // MARK: - Methods
  private func handleAuthenticationStatus(using authStatus: Bool) {
    
    switch authStatus {
      
    case true:
      statusLabel.text = "Found authenticated user! Logging in..."
      
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
        
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.showTabController()
        
      }
      
    case false:
      statusLabel.text = "You haven't logged in yet. Taking you to login..."
      
      DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
        self.activityIndicator.stopAnimating()
        self.activityIndicator.isHidden = true
        self.showLoginController()
      }
      
    }
    
  }
  
  private func showTabController() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
    
    // TODO: Change after building initial selected tab
    let settingsController = tabController.viewControllers?[0] as! SettingsViewController
    settingsController.authenticationService = authenticationService
        
    show(tabController, sender: self)
    
  }
  
  private func showLoginController() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let loginController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
    
    loginController.authenticationService = authenticationService
    
    present(loginController, animated: true, completion: nil)
    
  }
  
  func handleSuccessfulLogin() {
    
    dismiss(animated: true, completion: {
      self.showTabController()
    })
    
  }
  
  // MARK: - Segues
  @IBAction func returnToLoadingView(segue: UIStoryboardSegue) {
    handleAuthenticationStatus(using: authenticationService.hasAuthenticated)
  }
  
}






