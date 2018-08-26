//
//  ProjectTableViewCell.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var starsLabel: UILabel?
    @IBOutlet weak var descriptionLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(for project: Project) {
        nameLabel?.text = project.name
        if let stars = project.startsCount {
            starsLabel?.text = String(stars)
        } else {
            starsLabel?.text = nil
        }
        descriptionLabel?.text = project.description
    }

}
