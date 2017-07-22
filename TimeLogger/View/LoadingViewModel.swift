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
  
  // MARK: - Properties
  let sceneCoordinator: SceneCoordinatorType
  let authenticationService: AuthenticationServiceType
  
  let disposeBag = DisposeBag()
  
  let loadingText = Variable<String>("Loading ...")
  
  
  // MARK: - Init
  init(coordinator: SceneCoordinatorType, authService: AuthenticationServiceType) {
    sceneCoordinator = coordinator
    authenticationService = authService
    
    print("LoadingVM Initialized: sceneCoord: \(self.sceneCoordinator), authServ: \(self.authenticationService)")
    
  }
  
  
  // MARK: - Computed Properties
  var authStatus: Observable<Bool> {
    return self.authenticationService.authenticateUser(withKey: APIKey.sharedInstance.value)
      .catchErrorJustReturn(User())
      .map { return $0.hasAuthenticated }
  }
  
  
  // MARK: - Methods
  
  
  
  func presentLogin() {
    
    let loginViewModel = LoginViewModel(
      sceneCoordinator: self.sceneCoordinator,
      authService: self.authenticationService, loginAction: tryLogin)
    
    sceneCoordinator.transition(to: Scene.login(loginViewModel), type: .modal)
    
  }
  
  lazy var tryLogin: Action<String, Bool> = {
    return Action { input in
      return self.authenticationService.authenticateUser(withKey: input)
        .catchErrorJustReturn(User())
        .map { $0.hasAuthenticated }
    }
  }()
  
  
}


