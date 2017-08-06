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
  //  let authStatus = Variable<Bool>(APIKey.sharedInstance.isAuthentic)
  
  
  // MARK: - Init
  init(coordinator: SceneCoordinatorType, authService: AuthenticationServiceType) {
    sceneCoordinator = coordinator
    authenticationService = authService
  }
  
  
  // MARK: - Computed Properties
  var authStatus: Observable<Bool> {
    return .just(APIKey.sharedInstance.isAuthentic)
  }
  
  
  // MARK: - Methods

  
  func presentLogin() {
    
    let loginViewModel = LoginViewModel(
      sceneCoordinator: self.sceneCoordinator,
      authService: self.authenticationService,
      loginAction: tryLogin)
    
    sceneCoordinator.transition(to: Scene.login(loginViewModel), type: .modal)
    
  }
  
  
  
  /// Lazily loaded Action for attempting to login using the provided key string. Output is a Bool representing request success.
  lazy var tryLogin: Action<String, Bool> = { this in
    return Action { input in
      return this.authenticationService.authenticateUser(withKey: input)
        .catchErrorJustReturn(User())
        .map { $0.hasAuthenticated }
    }
  }(self)
  
  
  
  /// Lazily loaded CocoaAction that handles Scene transition after successful login.
  lazy var loginSuccessful: CocoaAction = { this in
    return CocoaAction { _ in
      print("loginSuccessful Action THIS: \(this)")
      

      return this.sceneCoordinator.transition(to: Scene.mainTabBar(), type: .presentTabBar(andSelectIndex: 0))
    }
  }(self)
  
//  var newLoginSuccess: CocoaAction {
//    return CocoaAction { _ in
//
//    }
//  }
  
  
  deinit {
    print("** LOADING VM Deinitialized ******")
  }
  
}


