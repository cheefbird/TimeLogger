//
//  SettingsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/3/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RealmSwift
import RxSwift

class SettingsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var userIdLabel: UILabel!
  @IBOutlet weak var adminStatusLabel: UILabel!
  @IBOutlet weak var siteUrlLabel: UILabel!
  
  
  
  // MARK: - Properies
  private var authenticationService: AuthenticationService!
  private var authenticatedUser: User!
  private var sceneCoordinator: SceneCoordinatorType!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let delegate = UIApplication.shared.delegate as? AppDelegate,
      let appWindow = delegate.window {
      sceneCoordinator = SceneCoordinator(window: appWindow)
    }
    
    authenticationService = AuthenticationService()
    
    authenticatedUser = User.existing()
    
    
  }
  
  private func configureView(using user: User) {
    
    firstNameLabel.text = user.firstName
    lastNameLabel.text = user.lastName
    userIdLabel.text = String(user.id)
    adminStatusLabel.text = user.isAdmin.description
    siteUrlLabel.text = user.url
    
  }
  
  
  // MARK: - Actions
  @IBAction private func logout(_ sender: AnyObject?) {
    
    authenticationService.logoutUser()
      .observeOn(MainScheduler.instance)
      .map { return $0.hasAuthenticated }
      .do(onNext: { authStatus in
        guard authStatus else { return }
        self.showDismissableAlert(self, title: "Uh Oh!", message: "Logout failed!")
      }, onError: { _ in
        self.showDismissableAlert(self, title: "Uh OH!", message: "Error when trying to log out!")
      })
      .subscribe(onNext: { authStatus in
        guard !authStatus else { return }
        let loadingViewModel = LoadingViewModel(coordinator: self.sceneCoordinator, authService: self.authenticationService)
        self.sceneCoordinator.transition(to: Scene.loading(loadingViewModel), type: .root)
      }, onError: { _ in
        print("ALERT: Error when attempting to log out!")
      })
      .disposed(by: disposeBag)

  }
}
