//
//  Company.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Company: Object {
  
  // MARK: - Properties
  dynamic var name = ""
  dynamic var id = 0
  let projects = LinkingObjects(fromType: Project.self, property: "company")
  
  
  // MARK - Init
  convenience init(name: String, id: Int) {
    self.init()
    
    self.name = name
    self.id = id
  }
  
  convenience init(fromJSON json: JSON) {
    self.init()
    name = json["name"].stringValue
    
    let idString = json["id"].stringValue
    if let id = Int(idString) {
      self.id = id
    }
  }
  
}






