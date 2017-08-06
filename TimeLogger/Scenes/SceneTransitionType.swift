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
  
  case root                                 // make view the app's ROOT view
//  case present                            // simple present function
  case presentTabBar(andSelectIndex: Int)   // special present for TAB BAR only
  case push                                 // push view to NAVIGATION stack
  case modal                                // present view MODALLY
  
}
