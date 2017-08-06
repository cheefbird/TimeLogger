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
  let running = Variable<Bool>(false)
  
  let disposeBag = DisposeBag()
  
  
  
  init(sceneCoordinator: SceneCoordinatorType,
       authService: AuthenticationServiceType,
       loginAction: Action<String, Bool>) {
    
    self.sceneCoordinator = sceneCoordinator
    self.authenticationService = authService
    self.loginAction = loginAction
    
    loginAction.executionObservables
      .flatMap { return $0 }
      .debug("tryLogin Action OUTPUT", trimOutput: false)
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] result in
        guard result else {
          self?.helperText.value = "Authentication failed. Please try again."
          self?.running.value = false
          return
        }
        
        self?.helperText.value = "Login successful! Preparing your data ..."
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
          self?.sceneCoordinator.transition(to: Scene.mainTabBar(), type: .presentTabBar(andSelectIndex: 0))
        }
        
        }, onError: { [weak self] error in
          self?.helperText.value = "An error occurred. Please try again."
          self?.running.value = false
          debugPrint(error)
        }, onDisposed: {
          print("TRYLOGIN ACTION DISPOSED **********")
      })
      .disposed(by: disposeBag)
    
  }
  
  
  deinit {
    print("** LOGIN VM Deinitialized **")
  }
  
}
