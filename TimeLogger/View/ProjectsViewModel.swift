//
//  ProjectsViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/5/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

class ProjectsViewModel {
  
  let sceneCoordinator: SceneCoordinatorType
  let projectService: ProjectServiceType
  let authenticationService: AuthenticationServiceType
  
  
  init(sceneCoordinator: SceneCoordinatorType, projectService: ProjectServiceType, authenticationService: AuthenticationServiceType) {
    self.sceneCoordinator = sceneCoordinator
    self.projectService = projectService
    self.authenticationService = authenticationService
  }
  
}
