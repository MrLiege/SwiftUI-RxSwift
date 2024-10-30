//
//  BodyParametersView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct BodyParametersView: View {
    var body: some View {
        VStack(spacing: 8) {
            bloodPressureTexts()
                .padding()
            
            enterParamTimeTextField()
                .padding()
            
            enterNoteTextField()
                .padding()
        }
    }
}

private extension BodyParametersView {
    @ViewBuilder
    func bloodPressureTexts() -> some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading) {
                Text("Кровяное давление")
                    .medium16StyleText()
                
                enterParamBloodTextField()
            }
            
            VStack(alignment: .leading) {
                Text("Пульс")
                    .medium16StyleText()
                
                enterParamPulseTextField()
            }
        }
    }
}

private extension BodyParametersView {
    @ViewBuilder
    func enterParamBloodTextField() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Систолическое")
                    .smallStyleText()
                
                TextField("120", text: .constant(""))
                    .addingTextFieldModifier()
            }
            
            VStack(alignment: .leading) {
                Text("Диастолическое")
                    .smallStyleText()
                
                TextField("90", text: .constant(""))
                    .addingTextFieldModifier()
            }
        }
    }
}

private extension BodyParametersView {
    @ViewBuilder
    func enterParamPulseTextField() -> some View {
        VStack {
            Text("")
                .smallStyleText()
            
            TextField("70", text: .constant(""))
                .addingTextFieldModifier()
        }
    }
}


private extension BodyParametersView {
    @ViewBuilder
    func enterParamTimeTextField() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Дата измерений")
                    .medium16StyleText()
                
                TextField("27.06.2024", text: .constant(""))
                    .addingTextFieldModifier()
            }
            
            VStack(alignment: .leading) {
                Text("Время измерений")
                    .medium16StyleText()
                
                TextField("17:00", text: .constant(""))
                    .addingTextFieldModifier()
            }
        }
    }
    
    @ViewBuilder
    func enterNoteTextField() -> some View {
        VStack(alignment: .leading) {
            Text("Заметка")
                .medium16StyleText()
            
            TextField("Опиши свое самочуствие", text: .constant(""))
                .addingTextFieldModifier()
        }
    }
}

#Preview {
    BodyParametersView()
}
