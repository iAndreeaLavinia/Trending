//
//  ProjectDetailsViewModel.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 27/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

class ProjectDetailsViewModel: NSObject {
    var project: Project?

    func getProjectDetails(completion: @escaping (Bool) -> Void) {
        guard let url = project?.detailsURL else {
            completion(false)
            return
        }
        
        Network.getProjectDetails(for: url) { (project) in
            self.project = project
            self.getReadMe(completion: { _ in
                completion(project != nil)
            })
        }
    }
    
    func getReadMe(completion: @escaping (Bool) -> Void) {
        guard let project = self.project else {
            completion(false)
            return
        }
        Network.getReadme(for: project,
                          completionHandler: { (readme) in
                            self.project?.readme = readme
                            completion(readme != nil)
        })
    }
}
