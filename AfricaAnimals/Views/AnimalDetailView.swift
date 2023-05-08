//
//  AnimalDetailView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 09/05/23.
//

import SwiftUI

struct AnimalDetailView: View {
    // MARK: - PROPERTY
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                // Hero
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // Title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // Headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // Gallery
                Group {
                    HeadingView(icon: "photo.on.rectangle.angled", title: "Wilderness in Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                
                // Facts
                Group {
                    HeadingView(icon: "questionmark.circle", title: "Did You Know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                // Description
                Group {
                    HeadingView(icon: "info.circle", title: "All About \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // Map
                Group {
                    HeadingView(icon: "map", title: "National Parks")
                    InsetMapView()
                }
                .padding(.horizontal)
                
                // Link
                Group {
                    HeadingView(icon: "books.vertical", title: "Learn More")
                    ExternalLinkView(animal: animal)
                }
                .padding(.horizontal)
                
            } // VStack
            .navigationTitle("Learn about \(animal.name)")
            .navigationBarTitleDisplayMode(.inline)
        } // Scroll
    }
}

// MARK: - PREVIEW

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals[0])
        }
    }
}
