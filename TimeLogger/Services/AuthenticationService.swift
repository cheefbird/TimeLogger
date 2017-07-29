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
  
  let disposeBag = DisposeBag()
  
  
  @discardableResult
  func authenticateUser(withKey key: String) -> Observable<User> {
    
    guard key != "None" else { return .error(TeamworkServiceError.authenticationFailed(key: key)) }
    
    let savedUser = withRealm("save new user") { realm -> Observable<User> in
      
      // This requests auth info using the key value. It will only ever return if the request succeeds, so we need to figure out bad requests.
      let user = RxAlamofire.requestJSON(TeamworkRouter.authenticate(key))
        .filter { response, _ in
          return 200..<300 ~= response.statusCode
        }
        .map { _, data -> JSON in
          let json = data as! [String: Any]
          let account = json["account"] as! [String: Any]
          
          return JSON(account)
        }
        .map { account -> User in
          return User(fromJSON: account)
        }
        .do(onNext: { newUser in
          APIKey.sharedInstance.isAuthentic = newUser.hasAuthenticated
          APIKey.sharedInstance.value = key
          try realm.write {
            realm.add(newUser, update: true)
          }
        })
      return user
    }
    
    return savedUser ?? .error(TeamworkServiceError.authenticationFailed(key: key))
    
  }
  
  
  @discardableResult
  func logoutUser() -> Observable<User> {
    let user = withRealm("delete user") { realm -> Observable<User> in
      
      guard let user = realm.object(ofType: User.self, forPrimaryKey: APIKey.sharedInstance.uniqueID) else {
        return .error(TimeLoggerError.userIdMismatch())
      }
      
      try realm.write {
        realm.delete(user)
      }
      
      APIKey.clear()
      
      return .just(User())
      
    }
    
    return user!
    
  }
}

















