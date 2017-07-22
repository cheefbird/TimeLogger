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
  let helperText = Variable<String>("Enter your Teamwork API key to login.")
  
  let disposeBag = DisposeBag()
  
  
  
  init(sceneCoordinator: SceneCoordinatorType, authService: AuthenticationServiceType, loginAction: Action<String, Bool>) {

    self.sceneCoordinator = sceneCoordinator
    self.authenticationService = authService
    self.loginAction = loginAction
    
    loginAction.executionObservables
      .flatMap { return $0 }
      .subscribe(onNext: { result in
        guard result else {
          self.helperText.value = "Authentication failed. Please try again."
          return
        }
        
        self.helperText.value = "Login successful! Preparing your data ..."
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
          sceneCoordinator.pop()
        }
      }, onError: { error in
        self.helperText.value = "An error occurred. Please try again."
        debugPrint(error)
      })
      .disposed(by: disposeBag)
    
  }
  
    
  
  
  
  
  
}
