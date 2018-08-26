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
    
    var viewModel: ProjectDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView() {
        userNameLabel.text = viewModel?.project?.user?.name ?? ""
        if let imageURL = URL(string: viewModel?.project?.user?.avatarURL ?? "") {
            userImageView.load(url: imageURL)
        }
    }

}
