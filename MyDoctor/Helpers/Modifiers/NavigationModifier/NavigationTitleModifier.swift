//
//  NavigationTitleModifier.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import SwiftUI

struct NavigationTitleModifier: ViewModifier {
    let title: String
    let imageName: String

    func body(content: Content) -> some View {
        content
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .frame(width: 40, height: 40)
                        Text(title)
                            .font(.headline)
                    }
                }
            }
    }
}

extension View {
    func customNavigationTitle(title: String, imageName: String) -> some View {
        self.modifier(NavigationTitleModifier(title: title, imageName: imageName))
    }
}
