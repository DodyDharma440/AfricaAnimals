//
//  MotionAnimationView.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 13/05/23.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTY
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    // MARK: - FUNCTIONS
    
    // 1. RAND COORDINATE
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // 2. RAND SIZE
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 10...300)
    }
    
    // 3. RAND SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // 4. RAND SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1)
    }
    
    // 5. RAND DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    // MARK: - BODY
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray.opacity(0.15))
                    .frame(width: randomSize(), height: randomSize(), alignment: .center)
                    .position(
                        x: randomCoordinate(max: geometry.size.width),
                        y: randomCoordinate(max: geometry.size.height)
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .animation(
                        Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                    )
                    .onAppear {
                        isAnimating = true
                    }
                } // Loop
            } // ZStack
            .drawingGroup()
        } // GeometryReader
    }
}

// MARK: - PREVIEW

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
