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
  
  let sceneCoordinator: SceneCoordinatorType
  let authenticationService: AuthenticationServiceType
  
  let loginAction: Action<String, Bool>
  let onSuccessfulLogin: CocoaAction
  
  let helperText = Variable<String>("Enter your Teamwork API key to login.")
  let running = Variable<Bool>(false)
  
  let disposeBag = DisposeBag()
  
  
  
  init(sceneCoordinator: SceneCoordinatorType,
       authService: AuthenticationServiceType,
       loginAction: Action<String, Bool>,
       onSuccessfulLogin: CocoaAction) {

    self.sceneCoordinator = sceneCoordinator
    self.authenticationService = authService
    self.loginAction = loginAction
    self.onSuccessfulLogin = onSuccessfulLogin
    
    loginAction.executionObservables
      .flatMap { return $0 }
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { result in
        guard result else {
          self.helperText.value = "Authentication failed. Please try again."
          self.running.value = false
          return
        }
        
        self.helperText.value = "Login successful! Preparing your data ..."
        
        let serialQueue = DispatchQueue(label: "Post-Login")
        serialQueue.sync {
          sceneCoordinator.pop()
        }
        serialQueue.sync {
          onSuccessfulLogin.execute()
        }

      }, onError: { error in
        self.helperText.value = "An error occurred. Please try again."
        debugPrint(error)
      })
      .disposed(by: disposeBag)
    
  }
  
}
