//
//  UIViewController+Alerts.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/11/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

// TODO: Create alert builder

extension UIViewController {
  
  func showDismissableAlert(_ presenter: UIViewController, title: String, message: String, completion: (() -> Void)? = nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertController.addAction(dismissAction)
    
    presenter.present(alertController, animated: true, completion: completion)
    
  }
}


