//
//  Exhibit.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

// Object at the exhibition.
class Exhibit {
    let title: String
    let images: [String]
    
    init(atTitle title: String, atImages images: [String]) {
        self.title = title
        self.images = images
    }
}
