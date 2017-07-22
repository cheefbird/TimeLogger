//
//  APIKey.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import KeychainAccess


class APIKey: TeamworkCredential {
  
  static let sharedInstance = APIKey()
  
  
  private init() {}
  
  
  
  /// Keychain using bundle ID for service name.
  var keychain: Keychain {
    return Keychain(service: "com.fbreidenbach.TimeLogger")
  }
  
  
  /// User's Teamwork API key. Stored in user's keychain.
  var value: String {
    get {
      guard let key = try? keychain.getString("TeamworkAPIKey"),
        key != nil else {
          return "None"
      }
      return key!
    }
    
    set {
      try! keychain.set(newValue, key: "TeamworkAPIKey")
    }
  }
  
  
  
  /// Indicates if the current stored apiKey has been used to authenticate successfully.
  var isAuthentic: Bool {
    get {
      return UserDefaults.standard.bool(forKey: "HasAuthenticTeamworkKey")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "HasAuthenticTeamworkKey")
    }
  }
  
  
  
  /// Holds the unique Teamwork User ID to allow easier validation of stored user info. Should reflect User Realm's primaryKey().
  var uniqueID: Int {
    
    get {
      return UserDefaults.standard.integer(forKey: "UniqueTeamworkUserID")
    }
    set {
      UserDefaults.standard.set(newValue, forKey: "UniqueTeamworkUserID")
    }
    
  }
  
}
