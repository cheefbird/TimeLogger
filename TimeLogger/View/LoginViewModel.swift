//
//  LoginViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/2/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift
import Action


class LoginViewModel {
  
  let loginAction: Action<String, Void>
  let disposeBag = DisposeBag()
  
  
  
  init(sceneCoordinator: SceneCoordinatorType, loginAction: Action<String, Void>) {

    self.loginAction = loginAction
    
    loginAction.executionObservables
      .take(1)
      .subscribe(onNext: { _ in
        sceneCoordinator.pop()
      })
      .disposed(by: disposeBag)
    
  }
  
    

  
  
  
  
}
