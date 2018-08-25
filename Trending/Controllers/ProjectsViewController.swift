//
//  ViewController.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    var viewModel: ProjectsViewModel = ProjectsViewModel.sharedModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProjectTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as? ProjectTableViewCell,
              indexPath.row < viewModel.projects.count else {
            return UITableViewCell()
        }
        let project = viewModel.projects[indexPath.row]
        cell.configureCell(for: project)
        return cell
    }
}

