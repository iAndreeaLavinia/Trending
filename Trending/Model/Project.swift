//
//  Project.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

public typealias JSONType = [String: Any]

/**
 Constants for dictionary keys
 */
fileprivate struct ModelConstants {
    static let name = "name"
    static let user = "owner"
    static let description = "description"
    static let startsCount = "stargazers_count"
    static let forksCount = "forks_count"
    static let detailsURL = "url"
}

struct Project {
    let name: String
    let startsCount: Int?
    let forksCount: Int?
    let description: String?
    var user: User?
    let detailsURL: String?
    
    init?(withData data: JSONType) {
        // required values
        guard let name = data[ModelConstants.name] as? String,
              let owner = data[ModelConstants.user] as? JSONType else {
                return nil
        }
        
        self.name = name
        self.startsCount = data[ModelConstants.startsCount] as? Int
        self.forksCount = data[ModelConstants.forksCount] as? Int

        self.description = data[ModelConstants.description] as? String
        self.user = User(withData: owner)
        self.detailsURL = data[ModelConstants.detailsURL] as? String
    }

}
