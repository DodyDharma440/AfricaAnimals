//
//  ContentView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                
                ForEach(animals) { animal in
                    NavigationLink(destination: AnimalDetailView(animal: animal)) {
                        AnimalListItemView(animal: animal)                        
                    }
                }
            } // List
            .listStyle(.inset)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        } // Navigation
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
