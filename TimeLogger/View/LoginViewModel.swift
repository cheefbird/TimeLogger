//
//  LoginViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/2/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift


class LoginViewModel {
  
  let sceneCoordinator: SceneCoordinatorType
  let authenticationService: AuthenticationServiceType
  
  let disposeBag = DisposeBag()
  
  
  
  init(sceneCoordinator: SceneCoordinatorType, authService: AuthenticationServiceType) {

    self.sceneCoordinator = sceneCoordinator
    self.authenticationService = authService
    
  }
  
    
  
  
  
  
  
}
