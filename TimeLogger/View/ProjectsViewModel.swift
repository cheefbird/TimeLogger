//
//  ProjectsViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/5/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift

class ProjectsViewModel {
  
  let sceneCoordinator: SceneCoordinatorType
  let projectService: ProjectServiceType
  
  
  
  init(sceneCoordinator: SceneCoordinatorType, projectService: ProjectServiceType) {
    self.sceneCoordinator = sceneCoordinator
    self.projectService = projectService
  }
  
  
  
  
  
}
