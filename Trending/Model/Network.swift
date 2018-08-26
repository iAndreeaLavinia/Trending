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
                        print("Malformed data received from fetchAllNews service")
                        completionHandler(nil)
                        return
                }
                
                let allProjects = projects.compactMap({ (project) -> Project? in
                    return Project(withData: project)
                })
                
                completionHandler(allProjects)
        }
        
        
        
    }
}

