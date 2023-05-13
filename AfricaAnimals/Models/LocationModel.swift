//
//  LocationModel.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 13/05/23.
//

import Foundation
import MapKit

struct Location: Decodable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
