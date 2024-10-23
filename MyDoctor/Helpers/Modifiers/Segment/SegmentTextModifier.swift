//
//  SegmentTextModifier.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import SwiftUI

struct SegmentTextModifier: ViewModifier {
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .font(.system(size: 14, weight: isSelected ? .semibold : .regular))
            .foregroundColor(.black)
            .padding(8)
            .background(isSelected ? Color(UIColor(red: 206/255, green: 221/255, blue: 233/255, alpha: 0.3)) : Color.clear)
            .cornerRadius(12)
    }
}

extension View {
    func segmentText(isSelected: Bool) -> some View {
        self.modifier(SegmentTextModifier(isSelected: isSelected))
    }
}
