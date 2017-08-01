//
//  ProjectsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift

class ProjectsViewController: UIViewController, BindableType {

  
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - Properties
  var viewModel: ProjectsViewModel?
  
  
  // MARK: - Default
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("ProjectsViewController: ViewDidLoad() called")
    
    bindViewModel()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("RxSwift Resources: \(RxSwift.Resources.total)")
    
  }
  
  //MARK: - Methods
  func bindViewModel() {
    print("ProjectsViewController: bindViewModel() called!")
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
