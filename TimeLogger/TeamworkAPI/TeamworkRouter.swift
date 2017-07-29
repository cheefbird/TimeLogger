//
//  TeamworkRouter.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/23/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//
import Foundation
import Alamofire



enum TeamworkRouter: URLRequestConvertible {
  
  // MARK: - Cases
  case authenticate(String)
  case getAllProjects
  
  
  // MARK: - URL Components
  
  /// Set base URL for the request. Authentication utilizes teamwork's generic auth endpoint.
  var baseURL: String {
    
    switch self {
    case .authenticate:
      return "https://authenticate.teamwork.com"
    default:
      guard let user = User.existing(),
        user.url.characters.count > 0 else { return "" }
      
      return user.url
    }
    
  }
  
  
  /// Set request method: GET, PUT, POST, etc.
  var method: HTTPMethod {
    
    switch self {
      
    case .authenticate:
      return .get
    case .getAllProjects:
      return .get
      
    }
  }
  
  
  /// Path to append to baseURL. Must begin with "/".
  var relativePath: String {
    
    switch self {
      
    case .authenticate:
      return "/authenticate.json"
    case .getAllProjects:
      return "/projects.json"
      
    }
    
  }
  
  
  /// Set request parameters.
  var parameters: Parameters? {
    
    switch self {
      
    case .authenticate:
      return nil
    case .getAllProjects:
      var params = Parameters()
      params["includePeople"] = true
      return params
    }
    
  }
  
  
  /// Sets request headers. Default JSON headers are included without needing to be specified.
  var headers: [String: Any] {
    
    var headers = [String: Any]()
    
    headers["Content-Type"] = "application/json"
    headers["Accept"] = "application/json"
    
    switch self {
      
    case .authenticate(let key):
      do {
        let encodedKey = try encode(apiKey: key)
        headers["Authorization"] = "Basic \(encodedKey)"
        return headers
      } catch let error {
        print(error.localizedDescription)
        return headers
      }
    case .getAllProjects:
      do {
        let encodedKey = try encode(apiKey: APIKey.sharedInstance.value)
        headers["Authorization"] = "Basic \(encodedKey)"
        return headers
      } catch let error {
        print(error.localizedDescription)
        return headers
      }
    }
  }
  
  
  func asURLRequest() throws -> URLRequest {
    
    guard let url = URL(string: baseURL) else {
      throw TeamworkError.routingError(reason: "Error converting baseURL to URL")
    }
    
    let fullURL = url.appendingPathComponent(relativePath)
    
    var urlRequest = URLRequest(url: fullURL)
    urlRequest.httpMethod = method.rawValue
    
    for (key, value) in headers {
      urlRequest.setValue(value as? String, forHTTPHeaderField: key)
    }
    
    let encoding = URLEncoding.default
    
    return try encoding.encode(urlRequest, with: nil)
  }
  
}

// MARK: - Key Encoder
extension TeamworkRouter {
  
  fileprivate func encode(apiKey key: String) throws -> String {
    
    guard key.characters.count > 0 else {
      throw TeamworkError.keyEncoderError(reason: "Cannot encode an empty key")
    }
    
    let keyWithPassword = key.appending(":fuckthisjob")
    
    var encodedResult: String
    let keyAsData = keyWithPassword.data(using: .utf8)
    
    if let encodedKey = keyAsData?.base64EncodedString() {
      encodedResult = encodedKey
      return encodedResult
    } else {
      throw TeamworkError.keyEncoderError(reason: "Failed to encode key data as base 64 string")
    }
  }
}

