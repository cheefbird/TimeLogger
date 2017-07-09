//
//  TeamworkServiceError.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/2/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation


enum TeamworkServiceError: Error {
  
  case existingUserLoadFailed(String)
  case authStatusRetrievalFailed(String)
  case authenticationFailed(key: String)
  case logoutFailed
  
  
}
