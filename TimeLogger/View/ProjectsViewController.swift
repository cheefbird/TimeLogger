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
    let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
    return cell
  }
}

extension ProjectsViewController: UITableViewDelegate {
  
  
  
}
