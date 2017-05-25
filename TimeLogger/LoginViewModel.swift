//
//  LoginViewModel.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import CoreData

struct LoginViewModel {
  
  
  // MARK: - Dependencies
  
//  var managedContext: NSManagedObjectContext
  
  let navigationService: NavigationService
  
  let authenticationService: AuthenticationService
  
  
  // MARK: - Initialize
  init(navigationService: NavigationService, authenticationService: AuthenticationService) {
    
//    self.managedContext = managedContext
    self.navigationService = navigationService
    self.authenticationService = authenticationService
    
  }
  
  
  // MARK: - Methods
  
  func authenticate(using key: String, resultHandler: @escaping (Bool) -> Void) {
    authenticationService.authenticate(usingAPIKey: key) { result in
      
      guard result.isSuccess else {
        resultHandler(false)
        print("Authentication returned failure result")
        return
      }
      
      
      
    }
  }
  
  
}
