//
//  ExternalLinkView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 09/05/23.
//

import SwiftUI

struct ExternalLinkView: View {
    // MARK: - PROPERTY
    
    let animal: Animal
    
    // MARK: - BODY
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            } // HStack
        } // Box
    }
}

// MARK: - PREVIEW

struct ExternalLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
