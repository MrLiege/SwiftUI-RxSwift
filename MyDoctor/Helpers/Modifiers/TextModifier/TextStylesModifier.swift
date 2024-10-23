//
//  TextStylesModifier.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import SwiftUI

// MARK: -- Big Text
struct BigStyleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.black)
    }
}

// MARK: -- Medium 16 Text
struct Medium16StyleText: ViewModifier {
    var weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: weight))
            .foregroundColor(.black)
    }
}

// MARK: -- Medium 14 Text
struct Medium14StyleText: ViewModifier {
    var weight: Font.Weight
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: weight))
            .foregroundColor(color)
    }
}

// MARK: -- Small Text
struct SmallStyleText: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 10, weight: .thin))
            .foregroundColor(color)
    }
}


// MARK: -- Extension
extension View {
    func bigStyleText() -> some View {
        self.modifier(BigStyleText())
    }
    
    func medium16StyleText(weight: Font.Weight = .regular) -> some View {
        self.modifier(Medium16StyleText(weight: weight))
    }
    
    func medium14StyleText(weight: Font.Weight = .regular, color: Color = .black) -> some View {
        self.modifier(Medium14StyleText(weight: weight, color: color))
    }
    
    func smallStyleText(color: Color = .black) -> some View {
        self.modifier(SmallStyleText(color: color))
    }
}
