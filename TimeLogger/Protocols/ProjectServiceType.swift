//
//  ProjectServiceType.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/6/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift


protocol ProjectServiceType: TeamworkService {
  
  func getAllProjects() -> Observable<[Project]>
  
  
  
  
  
  
}
