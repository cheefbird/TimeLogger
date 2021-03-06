//
//  SceneCoordinator.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/28/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class SceneCoordinator: SceneCoordinatorType {
  
  fileprivate var window: UIWindow
  fileprivate var currentViewController: UIViewController
  
  required init(window: UIWindow) {
    self.window = window
    currentViewController = window.rootViewController!
  }
  
  static func actualViewController(for viewController: UIViewController) -> UIViewController {
    
    if let tabController = viewController as? UITabBarController {
      return tabController.selectedViewController!
    } else {
      return viewController
    }
    
  }
  
  
  @discardableResult
  func transition(to scene: Scene, type: SceneTransitionType) -> Observable<Void> {
    
    let subject = PublishSubject<Void>()
    let viewController = scene.viewController()
    
    switch type {
      
    case .root:
      currentViewController = SceneCoordinator.actualViewController(for: viewController)
      window.rootViewController = viewController
      subject.onCompleted()
      
      
    case .push:
      guard let navigationController = currentViewController.navigationController else {
        fatalError("Can't push a view controller without a current navigation controller!")
      }
      
      // This code creates an observable to report when the viewController has been pushed successfully
      _ = navigationController.rx.delegate
        .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
        .map { _ in }
        .bind(to: subject)
      
      navigationController.pushViewController(viewController, animated: true)
      currentViewController = SceneCoordinator.actualViewController(for: viewController)
      
    case .modal:
      currentViewController.present(viewController, animated: true) {
        subject.onCompleted()
      }
      currentViewController = SceneCoordinator.actualViewController(for: viewController)
    }
    
    return subject.asObservable()
      .take(1)
      .ignoreElements()
    
  }
  
  
  @discardableResult
  func pop(animated: Bool) -> Observable<Void> {
    
    let subject = PublishSubject<Void>()
    
    if let presenter = currentViewController.presentingViewController {
      
      currentViewController.dismiss(animated: animated) {
        
        self.currentViewController = SceneCoordinator.actualViewController(for: presenter)
        subject.onCompleted()
        
      }
    } else if let navigationController = currentViewController.navigationController {
      
      // Creates observable that reports when the controller is successfully shown
      _ = navigationController.rx.delegate
        .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
        .map { _ in }
        .bind(to: subject)
      
      guard navigationController.popViewController(animated: animated) != nil else {
        fatalError("Can't navigate back from \(currentViewController)")
      }
      currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
      
    } else {
      fatalError("Not a modal or no navigation controller present. Can't go back from \(currentViewController)")
    }
    
    return subject.asObservable()
      .take(1)
      .ignoreElements()
    
  }
  
  
}








