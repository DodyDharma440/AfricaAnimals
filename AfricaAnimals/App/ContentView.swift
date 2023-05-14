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
    let haptic = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridView: Bool = false
    
    @State private var gridColumns: Int = 1
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridIcon: String = "square.grid.2x2"
    
    // MARK: - FUNCTIONS
    
    func switchGrid() {
        gridColumns = gridColumns % 3 + 1
        
        switch gridColumns {
        case 1:
            gridIcon = "square.grid.2x2"
        case 2:
            gridIcon = "square.grid.3x2"
        case 3:
            gridIcon = "rectangle.grid.1x2"
        default:
            gridIcon = "square.grid.2x2"
        }
        
        gridLayout = Array(repeating: .init(.flexible()), count: gridColumns)
    }
    
    // MARK: - BODY
    
    var body: some View {
        NavigationView {
            Group {
                if !isGridView {
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
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        } // Grid
                        .padding(10)
                        .animation(.easeIn)
                    } // Scroll
                } // Condition
            } // Group
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        Button(action: {
                            isGridView = false
                            gridColumns = 1
                            gridIcon = "square.grid.2x2"
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridView ? .primary : .accentColor)
                        })
                        
                        Button(action: {
                            isGridView = true
                            switchGrid()
                            haptic.impactOccurred()
                        }, label: {
                            Image(systemName: gridIcon)
                                .font(.title2)
                                .foregroundColor(isGridView ? .accentColor : .primary)
                        })
                    } // HStack
                } // ToolbarItem
            }
        } // Navigation
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
