//
//  MapAnnotationView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 13/05/23.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTY
    
    var location: Location
    @State private var animation: Double = 0.0
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(animation * 2)
                .opacity(animation == 1 ? 0 : 1)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
            .clipShape(Circle())
        } // ZStack
        .onAppear {
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [Location] = Bundle.main.decode("locations.json")
        
    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
