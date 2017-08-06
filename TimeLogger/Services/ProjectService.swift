//
//  ProjectService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/6/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import RxSwift
//import Alamofire
import RxAlamofire
import SwiftyJSON


class ProjectService: ProjectServiceType {
  
  
  
  func getAllProjects() -> Observable<[Project]> {
    
    let savedProjects = withRealm("get all projects") {
      realm -> Observable<[Project]> in
      
      let projects = RxAlamofire.requestJSON(TeamworkRouter.getAllProjects)
        .filter { response, _ in
          return 200..<300 ~= response.statusCode
        }
        .map { _, responseBody -> [Project] in
          let responseDict = responseBody as! [String: Any]
          let projectsJSON = responseDict["projects"] as! [[String: Any]]
          
          var projects = [Project]()
          
          for project in projectsJSON {
            let json = JSON(project)
            let newProject = Project(fromJSON: json)
            realm.add(newProject, update: true)
            projects.append(newProject)
          }
          return projects
      }
      return projects
    }
    
    return savedProjects ?? .error(TeamworkError.generalResponseError("getAllProjects failed"))
    
  }
  
  
  init() {
    print("ProjectService initialized ...")
  }

  
  
}
