//
//  TeamworkService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/30/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RealmSwift



protocol TeamworkService {
  
  func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T?
  
  
}

extension TeamworkService {
  
  func withRealm<T>(_ operation: String, action: (Realm) throws -> T) -> T? {
    
    do {
      let realm = try Realm()
      return try action(realm)
      
    } catch let error {
      
      print("Failed \(operation) in realm with error: \(error)")
      return nil
    }
    
  }
  
  
  
  
}
