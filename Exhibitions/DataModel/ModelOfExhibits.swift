//
//  ModelOfExhibits.swift
//  Exhibitions
//
//  Created by ket on 4/15/19.
//  Copyright © 2019 ket. All rights reserved.
//

import Foundation

// Data for decoding JSON.
struct ExhibitGallery: Decodable {
    let list: [ExhibitGalleryObject]
}

struct ExhibitGalleryObject: Decodable {
    let title: String
    let images: [String]
}
