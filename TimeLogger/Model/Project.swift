//
//  Project.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Project: Object {
  
  // MARK: - Properties
  dynamic var isFavorite = false
  dynamic var dateCreated = ""
  let categories = LinkingObjects(fromType: Category.self, property: "projects")
  dynamic var dateStarted = ""
  dynamic var id = 0
  dynamic var dateEdited = ""
  let people = LinkingObjects(fromType: Person.self, property: "projects")
  dynamic var company: Company?
  dynamic var name = ""
  dynamic var userIsAdmin = false
  
  
  // MARK: - Computed Properties
  // (NOT stored in Realm)
  var category: Category {
    return categories.first ?? Category(id: 0, name: "None")
  }
  
  
  // MARK: - Init
  convenience init(fromJSON json: JSON) {
    self.init()
    
    isFavorite = json["starred"].boolValue
    dateCreated = json["created-on"].stringValue
    
    if let tempCategory = json["category"].dictionaryObject {
      let categoryJSON = JSON(tempCategory)
      Category.createAndSave(fromJSON: categoryJSON)
    }
    
    dateStarted = json["startDate"].stringValue
    
    let idString = json["id"].stringValue
    if let tempId = Int(idString) {
      id = tempId
    }
    
    dateEdited = json["last-changed-on"].stringValue
    
    if let tempArray = json["people"].arrayObject {
      let peopleArray = tempArray.map { id in
        return String(describing: id)
      }
      
      for id in peopleArray {
        
      }
    }
    
    
    
  }
  
  
  // MARK: - Override
  override static func primaryKey() -> String? {
    return "id"
  }
  
  
}





