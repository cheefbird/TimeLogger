//
//  AuthenticationService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

import KeychainAccess
import RealmSwift
import SwiftyJSON
import RxSwift
import RxAlamofire
//import Alamofire




struct AuthenticationService: AuthenticationServiceType {
  
  init() {
    print("AuthenticationService initialized")
  }
  
  //  var apiKey: APIKey
  
  //  var hasAuthenticated: Bool {
  //    let status = APIKey.sharedInstance.isAuthentic
  //    return status
  //  }
  
  func loadUser() -> Observable<User> {
    let user = User.retrieveSavedUser()
    guard user.id > 0 else { return .error(TeamworkServiceError.existingUserLoadFailed("No stored user")) }
    
    return .just(user)
    
  }
  
  @discardableResult
  func authenticateUser(withKey key: String) -> Observable<User> {
    
    let savedUser = withRealm("save new user") { realm -> Observable<User> in
      
      // This requests auth info using the key value. It will only ever return if the request succeeds, so we need to figure out bad requests.
      let user = RxAlamofire.requestJSON(TeamworkRouter.authenticate(key))
        .filter { response, _ in
          guard 200..<300 ~= response.statusCode else {
            throw TeamworkServiceError.authenticationFailed(key: key)
          }
          
          APIKey.sharedInstance.value = key
          return true
          
        }
        .map { _, data -> JSON in
          let json = data as! [String: Any]
          let account = json["account"] as! [String: Any]
          
          return JSON(account)
        }
        .map { account -> User in
          let newUser = User(fromJSON: account)
          try realm.write {
            realm.add(newUser, update: true)
          }
          
          return newUser
        }
        .do(onNext: { user in
          APIKey.sharedInstance.isAuthentic = user.hasAuthenticated
          APIKey.sharedInstance.value = key
          APIKey.sharedInstance.uniqueID = user.id
        }, onError: { error in
          APIKey.sharedInstance.isAuthentic = false
          APIKey.sharedInstance.uniqueID = 50
        })
      
      
      return user
    }
    
    return savedUser ?? .error(TeamworkServiceError.authenticationFailed(key: key))
    
  }
  
  
  @discardableResult
  func logoutUser() -> Observable<Void> {
    return .just()
  }
  
  
  
  
  
}

















