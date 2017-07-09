//
//  BindableType.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift


protocol BindableType {
  
  associatedtype ViewModelType
  
  var viewModel: ViewModelType { get set }
  
  func bindViewModel()
  
}


extension BindableType where Self: UIViewController {
  
  mutating func bindViewModel(using model: Self.ViewModelType) {
    self.viewModel = model
    loadViewIfNeeded()
    bindViewModel()
  }
  
}
