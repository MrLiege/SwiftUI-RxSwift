//
//  BackgroundModifier.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white)
            .cornerRadius(24)
            .shadow(radius: 20)
    }
}

extension View {
    func backgroundModifier() -> some View {
        self.modifier(BackgroundModifier())
    }
}
