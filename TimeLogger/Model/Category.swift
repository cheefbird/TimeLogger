//
//  Category.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON


class Category: Object {
  
  // MARK: - Properties
  dynamic var name = ""
  dynamic var id = 0
  
  
  // MARK: - Init
  convenience init(fromJSON json: JSON) {
    self.init()
    
    name = json["name"].stringValue
    
    let idString = json["id"].stringValue
    id = Int(idString) ?? 0
    
  }
  
  
  convenience init(id: Int, name: String) {
    self.init()
    
    self.name = name
    self.id = id
  }
  
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "id"
  }
  
  
  // MARK: - Methods
//  static func createAndSave(fromJSON json: JSON) {
//
//    let category = Category(fromJSON: json)
//    category.projects.append(<#T##object: Project##Project#>)
//
//    let realm = try! Realm()
//    try! realm.write {
//      realm.add(category, update: true)
//    }
//  }
  
  
}






