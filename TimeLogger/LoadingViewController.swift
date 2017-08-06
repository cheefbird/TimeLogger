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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("Loading view about to APPEAR")
    print("RxSwift Resources: \(RxSwift.Resources.total)")
  }
  
  deinit {
    print("** ALERT: LoadingViewController DEINITIALIZED :ALERT **")
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
      .subscribe(onNext: { [weak self] status in
        print("Authentication status: \(status)")
        guard status else {
          self?.viewModel.presentLogin()
          return
        }
        guard self?.presentedViewController == nil else {
          print("ALERT: LoadingViewController's presented VC wasn't nil -- couldn't try loading tab")
          return
        }
        self?.viewModel.loginSuccessful.execute()
      })
      .disposed(by: disposeBag)
    
  }
  
  
  
  
  
  // MARK: - Segues
  @IBAction func returnToLoadingView(segue: UIStoryboardSegue) {
    
  }
  
}
















