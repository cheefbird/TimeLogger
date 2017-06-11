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
  
  // MARK: - Alert Types
//  enum AlertAction {
//    
//    typealias Handler = (() -> Void)
//    
//    case accept(String, Handler?)
//    case cancel(String, Handler?)
//    
//    
//    func create() -> UIAlertAction {
//      
//      switch self {
//        
//        case .accept(let message)
//        
//      }
//      
//    }
//    
//  }
  
  func showDismissableAlert(_ presenter: UIViewController, title: String, message: String, completion: (() -> Void)? = nil) {
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alertController.addAction(dismissAction)
    
    presenter.present(alertController, animated: true, completion: completion)
    
  }
  
}


