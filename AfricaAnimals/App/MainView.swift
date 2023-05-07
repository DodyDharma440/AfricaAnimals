//
//  MainView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    TabItemView(icon: "square.grid.2x2", label: "Browse")
                }
            
            VideoListView()
                .tabItem {
                    TabItemView(icon: "play.rectangle", label: "Watch")
                }
            
            MapView()
                .tabItem {
                    TabItemView(icon: "map", label: "Locations")
                }
            
            GalleryView()
                .tabItem {
                    TabItemView(icon: "photo", label: "Gallery")
                }
        } // Tab
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
