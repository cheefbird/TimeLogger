//
//  ProjectsTableViewCell.swift
//  TimeLogger
//
//  Created by Francis Breidenbach on 6/12/17.
//  Copyright © 2017 Francis Breidenbach. All rights reserved.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
  
  // MARK: - Outlets
  @IBOutlet weak var projectNameLabel: UILabel!
  @IBOutlet weak var favoriteButton: UIButton!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
}
