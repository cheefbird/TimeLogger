//
//  Scene.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit


enum Scene {
  
  case loading(LoadingViewModel)
  case login(LoginViewModel)
  case mainTabBar()
  
}

extension Scene {
  
  // mainStoryboard implementation
  var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: nil)
  }
  
  
}
