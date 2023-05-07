//
//  CodableBundleExtension.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import Foundation

extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load data \(file) from bundle")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode the \(file) data")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
}
