//
//  AuthenticationService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

import KeychainAccess
import Alamofire
import RealmSwift
import SwiftyJSON

class AuthenticationService {
  
  // MARK: - Public Interface
  // GET auth status
  var hasAuthenticated: Bool {
    return hasValidKey
  }
  
  // GET key
  var apiKey: String {
    return secureKey ?? "None"
  }
  

  lazy var description: String = {
    return "AuthStatus: \(self.hasAuthenticated), APIKey: \(self.apiKey)"
  }()

  
  // MARK: - Constants
  private let keychain = Keychain(service: "com.fbreidenbach.TimeLogger")
  
  
  // MARK: - Private Interface
  private var secureKey: String? {
    
    get {
      guard let key = try? keychain.getString("TeamworkAPIKey"),
        key != nil else {
          return nil
      }
      
      return key
      
    }
    
    set {
      guard let newKey = newValue else { return }
      try! keychain.set(newKey, key: "TeamworkAPIKey")
    }
    
  }
  
  
  private var hasValidKey: Bool {
    
    get {
      return UserDefaults.standard.bool(forKey: "HasCompletedAuthentication")
    }
    
    set {
      UserDefaults.standard.set(newValue, forKey: "HasCompletedAuthentication")
    }
    
  }
  
  
  // MARK: - Teamwork Authentication
  func authenticate(withKey key: String, resultHandler: @escaping (Bool) -> Void) {
    
    Alamofire.request(TeamworkRouter.authenticate(key))
      .responseJSON { response in
        
        guard response.result.error == nil else {
          print(response.result.error!)
          resultHandler(false)
          return
        }
        
        guard let json = response.result.value as? [String: Any],
          let accountDict = json["account"] as? [String: Any] else {
            print("Something went wrong when attempting to serialize the response JSON.")
            resultHandler(false)
            return
        }
        
        let accountJSON = JSON(accountDict)
        
        self.secureKey = key
        self.hasValidKey = true
        self.buildAndSaveUser(from: accountJSON)
        
        resultHandler(true)
        
    }
    
  }
  
  private func buildAndSaveUser(from json: JSON) {
    
    let realm = try! Realm()
    let user = User(fromJSON: json)
    
    let existingUsers = realm.objects(User.self)
      .filter("id = %@", user.id)
    
    switch existingUsers.isEmpty {
      
    case true:
      try! realm.write {
        realm.add(user)
      }
      return
      
    case false:
      try! realm.write {
        realm.delete(existingUsers)
        realm.add(user)
      }
      return
      
    }
    
  }
  
  func clearUserInfo() {
    
    secureKey = nil
    hasValidKey = false
    
  }
  
}
















