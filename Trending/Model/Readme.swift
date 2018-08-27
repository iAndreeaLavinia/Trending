//
//  Readme.swift
//  Trending
//
//  Created by Andreea Lavinia Ionescu on 27/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

fileprivate struct ReadmeModelConstants {
    static let name = "name"
    static let htmlURL = "html_url"
}

struct Readme {
    let name: String?
    let htmlURL: String?
    
    init?(withData data: JSONType) {
        self.name = data[ReadmeModelConstants.name] as? String
        self.htmlURL = data[ReadmeModelConstants.htmlURL] as? String
    }
}

