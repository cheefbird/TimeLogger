//
//  MockAuthenticationService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/12/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import XCTest
@testable import TimeLogger

class MockAuthenticationService: AuthenticationService {
  
//  var hasAuthenticated: Bool
  
  var apikey: String
  
  init(auth: Bool, key: String) {
//    hasAuthenticated = auth
    apikey = key
  }
  
}

