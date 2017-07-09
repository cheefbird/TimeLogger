//
//  LoadingViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/4/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class LoadingViewController: UIViewController, BindableType {
  
  // MARK: - Outlets
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var viewModel: LoadingViewModel!
  let disposeBag = DisposeBag()
  
  // MARK: - Properties
  
  
  
  
  // MARK: - View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    statusLabel.text = "Loading ..."
    activityIndicator.startAnimating()
    
    
    
    // Check auth status and handle result
    //    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
    //      self.viewModel.handleAuthStatus()
    //    }
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    activityIndicator.stopAnimating()
  }
  
  
  func bindViewModel() {
    
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
      self.viewModel.authStatus.asObservable()
        .subscribe(onNext: { status in
          print("AuthStatus: \(status), handling ...")
          switch status {
          case true:
            self.viewModel.userIsAuthenticated()
            
          case false:
            self.viewModel.userNeedsLogin()
          }
        }, onError: { error in
          
        })
        .disposed(by: self.disposeBag)
    }
    
    
    
  }
  
  
  // MARK: - Methods
  
  
  
  
  
  // MARK: - Segues
  @IBAction func returnToLoadingView(segue: UIStoryboardSegue) {
    
  }
  
}






