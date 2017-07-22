//
//  ProjectsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - Properties
  var user: User!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
  }
  
}


extension ProjectsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
    
    switch indexPath.row {
      
    case 1:
      cell.textLabel?.text = "Name:"
      cell.detailTextLabel?.text = user.fullName
      
    case 2:
      cell.textLabel?.text = "ID:"
      cell.detailTextLabel?.text = String(user.id)
      
    default:
      cell.textLabel?.text = "error"
      cell.detailTextLabel?.text = "outside index 1 or 2"
      
    }
    
    return cell
    
  }
}


extension ProjectsViewController: UITableViewDelegate {
  
  
  
}
