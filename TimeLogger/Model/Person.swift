//
//  Person.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Person: Object {
  
  // MARK: - Properties
  dynamic var id = 0
  let projects = List<Project>()
  
  
  // MARK: - Init
  convenience init(id: Int) {
    self.init()
    self.id = id
  }
  
  
  // MARK: - Static Methods
  static func createAndSave(fromId id: Int) {
    
    let newPerson = Person(id: id)
    
    let realm = try! Realm()
    try! realm.write {
      realm.add(newPerson, update: true)
    }
    
  }
  
  
}





