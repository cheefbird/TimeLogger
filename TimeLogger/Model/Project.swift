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
  //  dynamic var category: Category?
  dynamic var dateStarted = ""
  dynamic var id = 0
  dynamic var dateEdited = ""
  let people = List<Person>()
  dynamic var company: Company?
  dynamic var name = ""
  dynamic var userIsAdmin = false
  
  
  // MARK: - Computed Properties
  // (NOT stored in Realm)
  
  
  
  // MARK: - Init
  convenience init(fromJSON json: JSON) {
    self.init()
    
    isFavorite = json["starred"].boolValue
    dateCreated = json["created-on"].stringValue
    
    dateStarted = json["startDate"].stringValue
    
    let idString = json["id"].stringValue
    if let tempId = Int(idString) {
      id = tempId
    }
    
    dateEdited = json["last-changed-on"].stringValue
    
    if let peopleArray = json["people"].arrayObject as? [String] {
      let peopleIdArray = peopleArray.map { id in
        return Int(id) ?? 0
      }
      
      for id in peopleIdArray {
        people.append(Person(id: id))
      }
    }
    
    let companyDict = json["company"]
    
    company = Company(fromJSON: companyDict)
    
    name = json["name"].stringValue
    userIsAdmin = json["isProjectAdmin"].boolValue
  }
  
  
  
  // MARK: - Override
  override static func primaryKey() -> String? {
    return "id"
  }
  
  
  // MARK: - Methods
  
  
}





