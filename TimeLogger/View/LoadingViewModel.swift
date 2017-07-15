//
//  LoadingViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action


class LoadingViewModel {
  
  let sceneCoordinator: SceneCoordinatorType
  let authenticationService: AuthenticationServiceType
  
  let disposeBag = DisposeBag()
  
  let authStatus = Variable<Bool>(APIKey.sharedInstance.isAuthentic)
  
//  private var currentUser = User()
  
  init(coordinator: SceneCoordinatorType, authService: AuthenticationServiceType) {
    sceneCoordinator = coordinator
    authenticationService = authService
    
    print("LoadingVM Initialized: sceneCoord: \(self.sceneCoordinator), authServ: \(self.authenticationService)")
    
  }
  
  
  
  // MARK: - Methods
  
  func presentLogin() {
    
    let loginViewModel = LoginViewModel(
      sceneCoordinator: self.sceneCoordinator,
      authService: self.authenticationService)
    
    sceneCoordinator.transition(to: Scene.login(loginViewModel), type: .modal)
    
  }
  
  func showMainTab() {
    
  }
  
  
}


