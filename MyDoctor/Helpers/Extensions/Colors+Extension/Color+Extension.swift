//
//  Color+Extension.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 24.10.2024.
//

import SwiftUI

extension Color {
    static func mainColor() -> Color {
        return Color(red: 245/255, green: 245/255, blue: 245/255)
    }
    
    static func redColor() -> Color {
        return Color(red: 255/255, green: 0/255, blue: 0/255, opacity: 0.5)
    }
    
    static func yellowColor() -> Color {
        return Color(red: 255/255, green: 193/255, blue: 34/255, opacity: 0.7)
    }
}
