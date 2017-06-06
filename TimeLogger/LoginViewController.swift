//
//  LoginViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  // MARK: - Outlets
  
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var apiKeyTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var loadingView: UIView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  
  // MARK: - Properties
  
  weak var authenticationService: AuthenticationService!
  weak var appDelegate: AppDelegate!
  
  
  // MARK: - Delegate Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadingView.isHidden = true
    loadingIndicator.isHidden = true
    
    statusLabel.text = "Enter your Teamwork API key to login."
    
  }
  
  // confirm deinit
  deinit {
    print("Login VC was deinitialized!")
  }
  
  
  // MARK: - Actions
  
  @IBAction func login(_ sender: AnyObject) {
    
    toggleLoadingIndicator()
    
    guard let key = apiKeyTextField.text,
      key.characters.count > 0 else {
        statusLabel.text = "You did not enter an API key.  Please try again by entering your Teamwork API key."
        return
    }
    
    authenticationService.authenticate(withKey: key) { success in
      
      switch success {
        
      case true:
        self.toggleLoadingIndicator()
        self.statusLabel.text = "Authentication successful! Now work on changing the root view controller!"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
          self.showMainTabController()
        }

      case false:
        self.toggleLoadingIndicator()
        self.statusLabel.text = "Authentication failed. Please try again."
        return
        
      }      
      
    }
    
  }
  
  private func showMainTabController() {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let tabController = storyboard.instantiateViewController(withIdentifier: "MainTabBarController") as! UITabBarController
    tabController.selectedIndex = 0
    
    appDelegate.window?.rootViewController = tabController
    appDelegate.window?.makeKeyAndVisible()
    
  }

  
}


// MARK: - Extension Methods
extension LoginViewController {
  
  fileprivate func toggleLoadingIndicator() {
    
    loadingView.isHidden = !loadingView.isHidden
    loadingIndicator.isHidden = !loadingIndicator.isHidden
    
    switch loadingIndicator.isHidden {
      
    case true:
      loadingIndicator.stopAnimating()
      
    case false:
      loadingIndicator.startAnimating()
      
    }
    
  }
  
}



