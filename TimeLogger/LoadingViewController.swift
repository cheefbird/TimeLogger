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
  
  
  // MARK: - Properties
  var viewModel: LoadingViewModel!
  let disposeBag = DisposeBag()
  
  let navigationDelayTime = RxTimeInterval() + 3
  
  
  
  // MARK: - View Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    
    activityIndicator.startAnimating()
    

    
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    activityIndicator.stopAnimating()
  }
  
  
  func bindViewModel() {
    
    viewModel.loadingText.asDriver()
      .drive(statusLabel.rx.text)
      .disposed(by: disposeBag)

    viewModel.authStatus
      .subscribeOn(MainScheduler.instance)
      .delaySubscription(navigationDelayTime, scheduler: MainScheduler.instance)
      .subscribe(onNext: { status in
        print("Authentication status: \(status)")
        guard status else {
          self.viewModel.presentLogin()
          return
        }
        print("ALERT ** TRYING TO LOAD TAB BAR ** ALERT")
      })
      .disposed(by: disposeBag)
    
  }
  
  
  
  
  
  // MARK: - Segues
  @IBAction func returnToLoadingView(segue: UIStoryboardSegue) {
    
  }
  
}
















