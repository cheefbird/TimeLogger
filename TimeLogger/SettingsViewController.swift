//
//  SettingsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/3/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RealmSwift

class SettingsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var userIdLabel: UILabel!
  @IBOutlet weak var adminStatusLabel: UILabel!
  @IBOutlet weak var siteUrlLabel: UILabel!
  
  
  
  // MARK: - Properies
  var authenticationService: AuthenticationService!
  private var authenticatedUser: User!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    let realm = try! Realm()
    authenticatedUser = realm.objects(User.self).first
    
    configureView(using: authenticatedUser)
    
    print(authenticationService.description)
    
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
    
    
    authenticationService.clearUserInfo()
    performSegue(withIdentifier: "returnToLoadingView", sender: nil)
    
  }
  
  
}
