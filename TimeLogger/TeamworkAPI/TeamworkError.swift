//
//  TeamworkError.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/24/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//
import Foundation

enum TeamworkError: Error {
  
  // MARK: - Router
  case routingError(reason: String)
  case keyEncoderError(reason: String)
  
  // MARK: - Response
  case generalResponseError(String)
  case responseThrewError(error: Error)
  case responseSerializationError(reason: String)
  
}
