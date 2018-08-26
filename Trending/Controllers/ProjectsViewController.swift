//
//  ViewController.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView?
    var viewModel: ProjectsViewModel = ProjectsViewModel.sharedModel

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Show loading
        viewModel.getProjects { (_) in
            self.tableView?.reloadData()
        }
    }

    // MARK: - Actions
    func showDetails(for project: Project) {
        let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "ProjectDetailsViewController") as! ProjectDetailsViewController
        let projectModel = ProjectDetailsViewModel()
        projectModel.project = project
        detailsVC.viewModel = projectModel
        navigationController?.show(detailsVC, sender: nil)
    }
}

extension ProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.projects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProjectTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ProjectTableViewCell", for: indexPath) as? ProjectTableViewCell,
            let projects = viewModel.projects,
            indexPath.row < projects.count else {
            return UITableViewCell()
        }
        let project = projects[indexPath.row]
        cell.configureCell(for: project)
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let projects = viewModel.projects,
            indexPath.row < projects.count else {
                return
        }
        let project = projects[indexPath.row]
        showDetails(for: project)
    }

}

extension ProjectsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //filter
        viewModel.searchedText = searchText
        tableView?.reloadData()
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.text = viewModel.searchedText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}

