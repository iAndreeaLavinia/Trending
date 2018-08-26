//
//  User.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 25/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

/**
 Constants for dictionary keys
 */
fileprivate struct UserModelConstants {
    static let name = "login"
    static let description = "description"
    static let avatarURL = "avatar_url"
}

class User {
    let name: String?
    let avatarURL: String?
//    let picture: UIImage
//    let description: String?
//    
    required init() {
        fatalError()
    }
    
    required init?(withData data: JSONType) {
        self.avatarURL = data[UserModelConstants.avatarURL] as? String
        self.name = data[UserModelConstants.name] as? String
    }
}
