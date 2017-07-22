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
  
  
  let disposeBag = DisposeBag()
  
  
  // MARK: - Delegate Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    apiKeyTextField.becomeFirstResponder()
  }
  
  func bindViewModel() {
    
    viewModel.helperText.asDriver()
      .drive(statusLabel.rx.text)
      .disposed(by: disposeBag)
    
    loginButton.rx.tap
      .withLatestFrom(apiKeyTextField.rx.text.orEmpty)
      .filter { $0.characters.count > 0 }
      .subscribe(viewModel.loginAction.inputs)
      .disposed(by: disposeBag)
    
    
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




