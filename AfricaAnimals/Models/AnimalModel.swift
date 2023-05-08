//
//  AnimalModel.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 08/05/23.
//

import SwiftUI

struct Animal: Decodable, Identifiable {
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
