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
    
  }
  
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "id"
  }
  
  // MARK: - Authenticated User
  static func retrieveSavedUser(withID userId: Int = APIKey.sharedInstance.uniqueID) -> User {
    let realm = try! Realm()
    return realm.object(ofType: User.self, forPrimaryKey: userId) ?? User()
  }
  
  
  
}


