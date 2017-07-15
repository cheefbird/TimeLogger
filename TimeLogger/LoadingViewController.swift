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
    
    let status = viewModel.authStatus.asObservable().share()
    
    status
      .filter { $0 }
      .subscribe(onNext: { [weak self] _ in
        self?.viewModel.presentLogin()
      })
      .disposed(by: disposeBag)
    
    status
      .filter { !$0 }
      .subscribe(onNext: { [weak self] _ in
        self?.viewModel.showMainTab()
      })
      .disposed(by: disposeBag)
    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    activityIndicator.stopAnimating()
  }
  
  
  func bindViewModel() {
    
    
    
    
  }
  
  // MARK: - Segues
  @IBAction func returnToLoadingView(segue: UIStoryboardSegue) {
    
  }
  
}
















