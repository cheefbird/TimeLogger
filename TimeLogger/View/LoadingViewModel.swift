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
  
  var authStatus = Variable<Bool>(APIKey.sharedInstance.isAuthentic)
  
  private var currentUser = User()
  
  init(coordinator: SceneCoordinatorType, authService: AuthenticationServiceType) {
    sceneCoordinator = coordinator
    authenticationService = authService
    
    authStatus.value = APIKey.sharedInstance.isAuthentic
    
    print("LoadingVM Initialized: sceneCoord: \(self.sceneCoordinator), authServ: \(self.authenticationService)")
    
  }
  
  
  
  // MARK: - Methods
  
  func userIsAuthenticated() {
    
    let user = User.retrieveSavedUser()
    let projectsViewModel = ProjectsViewModel(
      sceneCoordinator: self.sceneCoordinator,
      projectService: ProjectService(),
      currentUser: user)
    
  }
  
  func userNeedsLogin() {
    
    
    let loginViewModel = LoginViewModel(
      sceneCoordinator: self.sceneCoordinator,
      loginAction: self.loginAction)
    
    self.sceneCoordinator.transition(to: Scene.login(loginViewModel), type: .modal)
    
    
  }
  
  

  
  
  lazy var loginAction: Action<String, Void> = { this in
    
    return Action { key in
      return self.authenticationService
        .authenticateUser(withKey: key)
        .flatMap { user -> Observable<Void> in
          let projectsViewModel = ProjectsViewModel(
            sceneCoordinator: self.sceneCoordinator,
            projectService: ProjectService(),
            currentUser: user)
          
          return self.sceneCoordinator.transition(to: Scene.projects(projectsViewModel), type: .root)
      }
    }
    
  }(self)
  
}


