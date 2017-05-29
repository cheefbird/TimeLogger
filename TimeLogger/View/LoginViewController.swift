//
//  LoginViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


class LoginViewController: UIViewController {
  
  // MARK: - Outlet
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var keyTextField: UITextField!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Properties
  var viewModel: LoginViewModel!
  var navigationService: NavigationService!
  var authenticationService: AuthenticationService!
  
  
  // MARK: - Static Creation
  
  
  
  // MARK: - Actions
  @IBAction func authenticate() {
    guard let key = keyTextField.text else {
      return
    }
    authenticationService.authenticate(usingAPIKey: key) { result in
      
      switch result {
        
      case .success(let authStatus):
        guard authStatus else {
          self.statusLabel.text = "Something failed.  Success with false"
          return
        }
        
        guard self.authenticationService.apiKey.isValid else {
          self.statusLabel.text = "AuthService APIKey still set to false."
          return
        }
        
        self.navigationService.postAuthentication()
        
      case .failure(let error):
        self.statusLabel.text = "Authentication failed.  Try again"
        print(error.localizedDescription)
        return
        
      }
      
      
    }
    
  }
  
  
  
  
  // MARK: - Default Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    authenticationService = AuthenticationService()
    
  }
  
  
  // MARK: - Methods
  
  
}
