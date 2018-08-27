//
//  ProjectDetailsViewController.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectDetailsViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    var viewModel: ProjectDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel?.getProjectDetails(completion: { (_) in
            self.configureView()
        })
    }
    
    func configureView() {
        statusView.layer.borderWidth = 1.0
        statusView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.title = viewModel?.project?.name
        
        userNameLabel.text = viewModel?.project?.user?.name ?? ""
        if let imageURL = URL(string: viewModel?.project?.user?.avatarURL ?? "") {
            userImageView.load(url: imageURL)
        }
        projectDescriptionLabel.text = viewModel?.project?.description ?? ""
       
        var statusIsHidden = true
        if let stars = viewModel?.project?.startsCount {
            starsLabel.text = String(stars) + " Stars"
            statusIsHidden = false
        }
        
        if let forks = viewModel?.project?.startsCount {
            forksLabel.text = String(forks) + " Forks"
            statusIsHidden = false
        }
        statusView.isHidden = statusIsHidden
    }

}
