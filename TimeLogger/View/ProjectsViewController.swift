//
//  ProjectsViewController.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 7/20/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class ProjectsViewController: UIViewController, BindableType {
  
  
  
  // MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - Properties
  var viewModel: ProjectsViewModel!
  
  let disposeBag = DisposeBag()
  
  
  // MARK: - Default
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("ProjectsViewController: ViewDidLoad() called")
    
    
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print("RxSwift Resources: \(RxSwift.Resources.total)")
    
  }
  
  //MARK: - Methods
  func bindViewModel() {
    
  }
  
}


extension ProjectsViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    // Dummy cell
    return UITableViewCell()
    
    //    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    //    cell.textLabel?.text = projects[indexPath.row].name
    //    cell.detailTextLabel?.text = projects[indexPath.row].dateCreated
    //    cell.accessoryType = .disclosureIndicator
    //
    //    return cell
    
  }
}

extension ProjectsViewController: UITableViewDelegate {
  
  
  
}
