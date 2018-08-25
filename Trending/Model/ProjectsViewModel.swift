//
//  ProjectsViewModel.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectsViewModel {
    static let sharedModel = ProjectsViewModel()
    
    // the list of projects
    lazy var projects: [Project] = {
        return [Project]()
    }()
}
