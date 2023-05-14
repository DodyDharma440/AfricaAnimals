//
//  GalleryView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 07/05/23.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTY
    
    @State private var selectedAnimal = "lion"
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // BASIC GRID
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // STATIC GRID
    // let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID
    
    @State private var gridColumns: Double = 3.0
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    func switchGrid() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(.white, lineWidth: 8)
                    )
                
                // MARK: - SLIDER
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns, perform: { value in
                        switchGrid()
                    })
                
                
                // MARK: - GRID
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }
                } // VGrid
                .animation(.easeIn)
                .onAppear(perform: {
                    switchGrid()
                })
            } // VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } // Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView().ignoresSafeArea())
    }
}


// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
