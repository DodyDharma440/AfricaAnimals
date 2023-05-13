//
//  MapView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTY
    
    @State private var region: MKCoordinateRegion = {
        var coordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoom = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var region = MKCoordinateRegion(center: coordinates, span: mapZoom)
        
        return region
    }()
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    
    var body: some View {
        // MARK: - Basic Map
        // Map(coordinateRegion: $region)
        
        // MARK: - Annotations Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // Pin with old style (static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // Marker with new style (static)
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // Custom basic annotation (static)
            // MapAnnotation(coordinate: item.location) {
            //     Image("logo")
            //         .resizable()
            //         .scaledToFit()
            //         .frame(width: 32, height: 32, alignment: .center)
            // }
            
            // Custom annotaion
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) // Map
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } // HStack
                    Divider()
                    HStack {
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    } // HStack
                }
            } // HStack
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black
                .cornerRadius(8)
                .opacity(0.5)
            )
            .padding()
            , alignment: .top
        )
    }
}

// MARK: - PREVIEW

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
