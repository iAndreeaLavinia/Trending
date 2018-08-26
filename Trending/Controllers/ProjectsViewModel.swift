//
//  ProjectsViewModel.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit
import Apollo

struct ProjectConstants {
    static let gitHubToken = "6e8bfe19e6c2335e4684493a37d0bbea03932d5d"
}

class ProjectsViewModel {
    static let sharedModel = ProjectsViewModel()
    var projects: [Project]? {
        get {
            if let text = self.searchedText {
                let filteredProjects = self.rawProjects?.filter { project in
                    let isMatchingSearchText = project.name.lowercased().contains(text.lowercased()) || text.lowercased().count == 0
                    return isMatchingSearchText }
                return filteredProjects
            }
            return self.rawProjects
        }
    }
    var rawProjects: [Project]?
    var searchedText: String?
    
    func getProjects(completion: @escaping (Bool) -> Void) {
        Network.fetchData { (projectList) in
            self.rawProjects = projectList
            completion(projectList != nil)
        }
    }
    
    // the list of projects
    /*
    var projectsfromGraphQL: [SearchRepositoriesQuery.Data.Search.Edge.Node.AsRepository]?
    func getProjectsFromGraphQL(completion: @escaping () -> Void, errorHandler: @escaping (Error) -> Void) {
        let queryString = "GraphQL"
        
        let configuration: URLSessionConfiguration = .default
        configuration.httpAdditionalHeaders = ["Authorization": "Bearer \(ProjectConstants.gitHubToken)"]
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        let url = URL(string: "https://api.github.com/graphql")!
        let apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        
        apollo.fetch(query: SearchRepositoriesQuery(query: queryString, count: 10), resultHandler: { (result, error) in
            if let error = error {
                print("Error: \(error)")
                errorHandler(error)
                return
            }
            
            result?.data?.search.edges?.forEach { edge in
                guard let repository = edge?.node?.asRepository?.fragments.repositoryDetails else { return }
                print("Name: \(repository.name)")
                print("Path: \(repository.url)")
                print("Owner: \(repository.owner.resourcePath)")
                print("Stars: \(repository.stargazers.totalCount)")
                print("\n")
            }
            
            self.projects = result?.data?.search.edges?.compactMap { $0?.node?.asRepository }
            completion()
        })
    }*/
}
