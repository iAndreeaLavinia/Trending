//
//  ProjectDetailsViewController.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit
import WebKit

class ProjectDetailsViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    @IBOutlet weak var readmeLabel: UILabel!
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var readmeStackView: UIStackView!
    
    
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
        
        if let forks = viewModel?.project?.forksCount {
            forksLabel.text = String(forks) + " Forks"
            statusIsHidden = false
        }
        statusView.isHidden = statusIsHidden
        
        if let readMe = viewModel?.project?.readme {
            readmeStackView.isHidden = false

            let url = URL(string: readMe.htmlURL!)!
            webview.load(URLRequest(url: url))
            webview.allowsBackForwardNavigationGestures = true
            readmeLabel.text = readMe.name
        } else {
            readmeStackView.isHidden = true
        }
    }

}
