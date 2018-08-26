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
    
    var viewModel: ProjectDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        viewModel?.getProjectDetails(completion: { (_) in
            self.configureView()
        })
    }
    
    func configureView() {
        self.title = viewModel?.project?.name
        
        userNameLabel.text = viewModel?.project?.user?.name ?? ""
        if let imageURL = URL(string: viewModel?.project?.user?.avatarURL ?? "") {
            userImageView.load(url: imageURL)
        }
        projectDescriptionLabel.text = viewModel?.project?.description ?? ""
        print(viewModel?.project?.startsCount ?? "")
        print(viewModel?.project?.forksCount ?? "")
    }

}
