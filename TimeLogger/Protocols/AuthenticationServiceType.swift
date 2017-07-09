//
//  TeamworkService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import RxSwift


/// Provides basic information regarding a teamwork service.
protocol AuthenticationServiceType: TeamworkService {
  
  // MARK: - Properties
//  var apiKey: APIKey { get set }
//  var hasAuthenticated: Bool { get }
  
  
  // MARK: - Methods
  
  // Check authentication status
//  @discardableResult
//  func hasAuthenticated() -> Observable<Bool>
  
  
  // Perform authentication
  @discardableResult
  func authenticateUser(withKey key:String) -> Observable<User>
  
  
  // Log out of application
  @discardableResult
  func logoutUser() -> Observable<Void>

  
}





