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
  dynamic var hasAuthenticated = false
  
  
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
    
    hasAuthenticated = true
    
    APIKey.sharedInstance.uniqueID = numberID
    
  }
  
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "id"
  }
  
  
  // MARK: - Computed Properties
  var fullName: String {
    return "\(firstName) \(lastName)"
  }
  
  
  // MARK: - Static Methods
  static func existing() -> User? {
    
    let userId = APIKey.sharedInstance.uniqueID
    
    guard userId != 0 else { return nil }
    
    let realm = try! Realm()
    
    let result = realm.objects(User.self)
      .filter("hasAuthenticated = true")
    
    return result.first
  }

  
  
}


