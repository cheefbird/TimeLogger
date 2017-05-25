//
//  TeamworkAPIKey.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/24/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import KeychainAccess

struct APIKey {
  
  fileprivate let keychain = Keychain(service: "com.fbreidenbach.TimeLogger")
  fileprivate let keyName = "APIKey"
  fileprivate let authStatusName = "KeyIsAuthentic"
  
  var value: String {
    
    get {
      guard let key = try? keychain.getString(keyName) else {
        return ""
      }
      return key!
    }
    
    set {
      do {
        try keychain.set(newValue, key: keyName)
      } catch let error as Error {
        print("Error setting APIKey.value: \(error.localizedDescription)\n Full error: \(error)")
      }
    }
    
  }
  
  var isValid: Bool {
    
    get {
      
      return UserDefaults.standard.bool(forKey: authStatusName)
      
    }
    set {
      UserDefaults.standard.set(newValue, forKey: authStatusName)
    }
    
  }
  
}







