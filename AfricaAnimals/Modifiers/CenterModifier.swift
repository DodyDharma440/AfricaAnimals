//
//  CenterModifier.swift
//  AfricaAnimals
//
//  Created by Dodi Aditya on 14/05/23.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
