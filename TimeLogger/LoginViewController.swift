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
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      loadingView.isHidden = true
      loadingIndicator.isHidden = true
      
      statusLabel.text = ""

    }

}
