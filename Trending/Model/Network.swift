//
//  Network.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 26/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit
import Alamofire

struct Network {
    private static let url = "https://api.github.com/repositories?since=364"
    
    static func fetchData(completionHandler: @escaping ([Project]?)-> Void) {
        Alamofire.request(
            url,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    completionHandler(nil)
                    return
                }
                
                guard let projects = response.result.value as? [[String:Any]] else {
                        print("Malformed data received from get projects list service")
                        completionHandler(nil)
                        return
                }
                
                let allProjects = projects.compactMap({ (project) -> Project? in
                    return Project(withData: project)
                })
                
                completionHandler(allProjects)
        }
    }
    
    static func getProjectDetails(for projectURL: String,
                                  completionHandler: @escaping (Project?)-> Void) {
        Alamofire.request(
            projectURL,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    completionHandler(nil)
                    return
                }
                
                guard let project = response.result.value as? [String:Any] else {
                    print("Malformed data received from get project details service")
                    completionHandler(nil)
                    return
                }
                
                let projectObj = Project(withData: project)
                
                completionHandler(projectObj)
        }
    }
    
    static func getReadme(for project: Project,
                          completionHandler: @escaping (Readme?)-> Void) {
        let urlString = String(format: "https://api.github.com/repos/%@/readme", project.fullName)
        
        Alamofire.request(
            urlString,
            method: .get,
            parameters: nil)
            .validate()
            .responseJSON { (response) -> Void in
                guard response.result.isSuccess else {
                    completionHandler(nil)
                    return
                }
                
                guard let project = response.result.value as? [String:Any] else {
                    print("Malformed data received from get project details service")
                    completionHandler(nil)
                    return
                }
                
                let projectObj = Readme(withData: project)
                
                completionHandler(projectObj)
        }
    }
}

