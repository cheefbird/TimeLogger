//
//  LoginViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
  
  // MARK: - Outlet
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var keyTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Properties
  var viewModel: LoginViewModel!
  var navigationService: NavigationService!
  
  
  // MARK: - Lodaing Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginButton.rx.tap.asObservable()
      .map { self.keyTextField.text }
      .
    
  }
  
  
  // MARK: - Methods
  
  
}
