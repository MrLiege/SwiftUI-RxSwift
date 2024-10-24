//
//  BodyParametersView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct BodyParametersView: View {
    var body: some View {
        bloodPressureTexts()
            .padding()
    }
}

private extension BodyParametersView {
    @ViewBuilder
    func bloodPressureTexts() -> some View {
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
                TextField("120", text: .constant(""))
                    .addingTextFieldModifier()

                
            }
        }
    }
}

#Preview {
    BodyParametersView()
}
