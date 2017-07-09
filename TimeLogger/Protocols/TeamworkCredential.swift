//
//  TeamworkCredential.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/29/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation
import KeychainAccess


protocol TeamworkCredential {
  
  // MARK: - ReadOnly Properties
  var keychain: Keychain { get }
  
  var value: String { get set }
  
  var isAuthentic: Bool { get set }
  
  var uniqueID: Int { get set }
  
}

