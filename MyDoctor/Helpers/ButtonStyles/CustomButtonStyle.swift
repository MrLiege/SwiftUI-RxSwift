//
//  CustomButtonStyle.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import Foundation
import SwiftUI

struct SettingsButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 32, minHeight: 32)
            .background(Color.white)
            .foregroundColor(.black)
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 0)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}

struct AddDataButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .smallStyleText(color:(Color(red: 255/255, green: 159/255, blue: 118/255)))
            .padding(8)
            .background(Color.clear)
            .overlay(
                Capsule()
                    .stroke(Color(red: 255/255, green: 159/255, blue: 118/255), lineWidth: 2)
            )
            .foregroundColor(Color(red: 255/255, green: 159/255, blue: 118/255))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.spring(), value: configuration.isPressed)
    }
}

extension View {
    func settingButtonStyle() -> some View {
        self.buttonStyle(SettingsButtonStyle())
    }
    
    func addDataButtonStyle() -> some View {
        self.buttonStyle(AddDataButtonStyle())
    }
}
