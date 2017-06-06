//
//  TeamworkKey.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/2/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

class User: Object {
  
  // MARK: - Properties
  dynamic var firstName = ""
  dynamic var lastName = ""
  dynamic var id = 0
  dynamic var isAdmin = false
  dynamic var url = ""
  
  
  // MARK: - Init
  
  convenience init(fromJSON json: JSON) {
    self.init()
    
    let userID = json["userId"].stringValue
    guard let numberID = Int(userID) else { return }
    
    id = numberID
    firstName = json["firstname"].stringValue
    lastName = json["lastname"].stringValue
    isAdmin = json["userIsAdmin"].boolValue
    url = json["URL"].stringValue
    
  }
  
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "id"
  }
  
}


