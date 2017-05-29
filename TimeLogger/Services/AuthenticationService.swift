//
//  AuthenticationService.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import KeychainAccess
import Alamofire


class AuthenticationService {
  
  // Needs:
  // publicly read key value
  //    return storedKey as String
  // privately get/set actual key
  // publicly verify authentication
  // public func that will
  //    - update privately stored key if new
  //    - update auth status
  //    - return BOOL for fail/succeed
  
  
  var apiKey = APIKey()
  
  
  // MARK: - Public Methods
  func authenticate(usingAPIKey key: String, completion: @escaping (Result<Bool>) -> Void) {
    
    Alamofire.request(TeamworkRouter.authenticate(key))
      .validate()
      .responseJSON { response in
      
      let result = self.handleAuthenticationResponse(using: response, andKey: key)
      
      completion(result)
      
    }
    
  }
  
  // MARK: - Private Methods
  private func handleAuthenticationResponse(using response: DataResponse<Any>, andKey key: String) -> Result<Bool> {
    
    guard response.result.error == nil else {
      print("Error received while attempting authentication: \(response.result.error!)")
      return .failure(TeamworkError.responseError(error: response.result.error!))
    }
    
    guard let json = response.result.value as? [String: Any] else {
      print("ERROR: response value was not a JSON dictionary")
      return .failure(TeamworkError.responseSerializationError(reason: "Response was not a JSON dictionary"))
    }
    
    guard let status = json["STATUS"] as? String,
      status == "OK" else {
        apiKey.isValid = false
        return .failure(TeamworkError.responseSerializationError(reason: "Response's STATUS was not OK, response has failed"))
    }
    apiKey.value = key
    apiKey.isValid = true
    return .success(true)
    
  }
  
}
