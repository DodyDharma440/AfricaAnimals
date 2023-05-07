//
//  TabItemView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import SwiftUI

struct TabItemView: View {
    // MARK: - PROPERTY
    
    var icon: String
    var label: String
    
    // MARK: - BODY
    
    var body: some View {
        if #available(iOS 15.0, *) {
            Image(systemName: icon)
                .environment(\.symbolVariants, .none)
        } else {
            Image(systemName: icon)
        }
        Text(label)
    }
}

// MARK: - PREVIEW

struct TabItemView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            ContentView()
                .tabItem {
                    TabItemView(icon: "square.grid.2x2", label: "Browse")
                }
        }
    }
}
