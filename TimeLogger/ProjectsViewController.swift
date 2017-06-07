//
//  ProjectsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/3/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RealmSwift

class ProjectsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var firstNameLabel: UILabel!
  @IBOutlet weak var lastNameLabel: UILabel!
  @IBOutlet weak var userIdLabel: UILabel!
  @IBOutlet weak var adminStatusLabel: UILabel!
  @IBOutlet weak var siteUrlLabel: UILabel!
  
  
  // MARK: - Properies
  private var authenticatedUser: User!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let realm = try! Realm()
    authenticatedUser = realm.objects(User.self).first
    
    configureView(using: authenticatedUser)
    
  }
  
  private func configureView(using user: User) {
    
    firstNameLabel.text = user.firstName
    lastNameLabel.text = user.lastName
    userIdLabel.text = String(user.id)
    adminStatusLabel.text = user.isAdmin.description
    siteUrlLabel.text = user.url
    
  }
  
  
}
