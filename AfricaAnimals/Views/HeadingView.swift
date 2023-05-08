//
//  HeadingView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 09/05/23.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTY
    
    var icon: String
    var title: String
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
        } // HStack
        .padding(.vertical)
    }
}

// MARK: - PREVIEW

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(icon: "photo.on.rectangle.angled", title: "Wildness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
