//
//  SceneTransitionType.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import Foundation


/// Enum for each possible type of navigation action (i.e. push, pop, set as root)
enum SceneTransitionType {
  
  case root         // make view the app's root view
  case push         // push view to navigation stack
  case modal        // present view modally
  
}
