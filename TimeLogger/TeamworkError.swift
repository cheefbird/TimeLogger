//
//  TeamworkError.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/24/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation

enum TeamworkError: Error {
  
  case routingError(reason: String)
  case keyEncoderError(reason: String)
  case responseError(error: Error)
  case responseSerializationError(reason: String)
  
}
