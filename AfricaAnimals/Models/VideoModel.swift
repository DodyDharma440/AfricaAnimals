//
//  VideoModel.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 12/05/23.
//

import Foundation

struct Video: Decodable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
