//
//  LoginViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class LoginViewController: UIViewController, BindableType {
  
  // MARK: - Outlets
  
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var apiKeyTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var loadingView: UIView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  
  
  // MARK: - Properties
  var viewModel: LoginViewModel!
  
  var authenticationService: AuthenticationService!
  
  let disposeBag = DisposeBag()
  
  
  // MARK: - Delegate Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    statusLabel.text = "Enter your Teamwork API key to login."
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    apiKeyTextField.becomeFirstResponder()
  }
  
  func bindViewModel() {
    

    
  }

  
  
}
//
//
//// MARK: - Extension Methods
//extension LoginViewController {
//  
//  fileprivate func toggleLoadingIndicator() {
//    
//    loadingView.isHidden = !loadingView.isHidden
//    loadingIndicator.isHidden = !loadingIndicator.isHidden
//    
//    switch loadingIndicator.isHidden {
//      
//    case true:
//      loadingIndicator.stopAnimating()
//      
//    case false:
//      loadingIndicator.startAnimating()
//      
//    }
//    
//  }
//  
//}




