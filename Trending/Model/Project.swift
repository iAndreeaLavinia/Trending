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
    static let name = "full_name"
    static let user = "owner"
    static let description = "description"
}

struct Project {
    let name: String
//    let stars: Int
    let description: String?
    var user: User?
    
    init?(withData data: JSONType) {
        // required values
        guard let name = data[ModelConstants.name] as? String,
              let owner = data[ModelConstants.user] as? JSONType else {
                return nil
        }
        
        self.name = name
        self.description = data[ModelConstants.description] as? String
        self.user = User(withData: owner)
    }

}
