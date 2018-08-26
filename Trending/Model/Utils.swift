//
//  Utils.swift
//  Trending
//
//  Created by ANDREEA LAVINIA  on 27/08/2018.
//  Copyright © 2018 Andreea Lavinia Ionescu. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
