//
//  ProjectsViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/5/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift

struct ProjectsViewModel {
  
  let sceneCoordinator: SceneCoordinatorType
  let projectService: ProjectServiceType
  
  var currentUser: User
  
  init(sceneCoordinator: SceneCoordinatorType, projectService: ProjectServiceType, currentUser: User) {
    self.sceneCoordinator = sceneCoordinator
    self.projectService = projectService
    self.currentUser = currentUser
  }
  
}
