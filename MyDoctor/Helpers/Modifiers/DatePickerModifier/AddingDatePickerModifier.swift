//
//  AddingDatePickerModifier.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 01.12.2024.
//

import SwiftUI

struct AddingDatePickerModifier: ViewModifier {
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(14)
            .overlay(
                RoundedRectangle(cornerRadius: 14)
                    .stroke(isFocused ? Color.black : Color.clear, lineWidth: 2)
            )
            .focused($isFocused)
            .onTapGesture {
                isFocused = true
            }
    }
}

extension View {
    func addingDatePickerModifier() -> some View {
        self.modifier(AddingDatePickerModifier())
    }
}
