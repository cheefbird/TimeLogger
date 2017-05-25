//
//  User.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 5/24/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation


class User {
  
  let firstName: String
  let lastName: String
  let id: String
  var isAdmin: Bool
  
  init(first: String, last: String, id: String, admin: Bool) {
    self.firstName = first
    self.lastName = last
    self.id = id
    self.isAdmin = admin
  }
  
}
