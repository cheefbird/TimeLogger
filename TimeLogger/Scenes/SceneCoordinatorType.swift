//
//  SceneCoordinatorType.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/25/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift


protocol SceneCoordinatorType {
  
  // MARK: - Init
  init(window: UIWindow)
  
  
  // MARK: - Properties
//  var mainStoryboard: UIStoryboard { get }
  
  
  // MARK: - Methods
  /// Transition to another scene
  @discardableResult
  func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void>
  
  
  /// Pop scene from navigation stack or dismiss current modal
  @discardableResult
  func pop(animated: Bool) -> Observable<Void>
  
}


extension SceneCoordinatorType {
  
  // always use animated = true when calling pop(animated:)
  @discardableResult
  func pop() -> Observable<Void> {
    return pop(animated: true)
  }

}
