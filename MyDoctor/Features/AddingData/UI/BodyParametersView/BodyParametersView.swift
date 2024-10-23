//
//  BodyParametersView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct BodyParametersView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

private extension BodyParametersView {
    @ViewBuilder
    func BloodPressureTexts() -> some View {
        VStack {
            Text("Кровяное давление")
                .bigStyleText()
            
            HStack {
                Text("Систолическое")
                    .smallStyleText()
                
                Text("Диастолическое")
                    .smallStyleText()
            }
            
            HStack {
                Text("120")
                    .medium14StyleText(color: Color(.systemGray2))
                    
                
                
            }
        }
    }
}

#Preview {
    BodyParametersView()
}
