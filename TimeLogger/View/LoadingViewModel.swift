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
    
    print("LoadingVM Initialized: sceneCoord: \(self.sceneCoordinator), authServ: \(self.authenticationService)")
    
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
      loginAction: tryLogin,
      onSuccessfulLogin: loginSuccessful)
    
    sceneCoordinator.transition(to: Scene.login(loginViewModel), type: .modal)
    
  }
  
  //
  //    func presentMain() {
  //
  //      let projectService = ProjectService()
  //
  //      let projectsViewModel = ProjectsViewModel(sceneCoordinator: self.sceneCoordinator, projectService: projectService)
  //
  //      sceneCoordinator.transition(to: Scene.projects(projectsViewModel), type: .root)
  //
  //    }
  
  
  var tryLogin: Action<String, Bool> {
    return Action { input in
      return self.authenticationService.authenticateUser(withKey: input)
        .catchErrorJustReturn(User())
        .map { $0.hasAuthenticated }
        .do(onNext: { result in
          guard result else { return }
          print(result)
        })
      
    }
  }
  
  
  
  lazy var loginSuccessful: CocoaAction = { this in
    return CocoaAction { _ in
      let tabBarViewModel = TabBarViewModel(sceneCoordinator: this.sceneCoordinator)
      
      return self.sceneCoordinator.transition(to: Scene.mainTabBar(tabBarViewModel), type: .root)
      
    }
  }(self)
  
}


