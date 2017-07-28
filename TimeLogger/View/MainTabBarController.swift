//
//  MainTabBarController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/27/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, BindableType {

  // MARK: - Properties
  var hasLoaded = false
  var viewModel: TabBarViewModel!
  
  
  
  // MARK: - Default
  override func viewDidLoad() {
    super.viewDidLoad()
    delegate = self
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: - Methods
  func bindViewModel() {
    
  }
  
  
  
  func configureProjectsTab(projectService: ProjectServiceType) {
    
    guard selectedIndex == 0,
      let projectsVC = viewControllers![0] as? ProjectsViewController else {
        return
    }
    
//    let viewModel = ProjectsViewModel(sceneCoordinator: self.sceneCoordinator, projectService: projectService)
//    
//    projectsVC.viewModel = viewModel
    
  }
  
}



// MARK: - Delegate

extension MainTabBarController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
    
  }
  
}
