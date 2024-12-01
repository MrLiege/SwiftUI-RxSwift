//
//  BodyParametersView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct BodyParametersView: View {
    @State private var systolicPressure: String = ""
    @State private var diastolicPressure: String = ""
    @State private var pulse: String = ""
    @State private var measurementDate: Date = Date()
    @State private var measurementTime: Date = Date()
    @State private var note: String = ""
    @State private var isFormValid: Bool = false
    @State private var showAlert: Bool = false
    
    @ObservedObject var viewModel: AddingDataViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            bloodPressureTexts()
                .padding()
            
            enterParamTimeTextField()
                .padding()
            
            enterNoteTextField()
                .padding()
            
            Spacer()
            savingParametersButton()
                .padding()
        }
        .onChange(of: systolicPressure) { _ in validateForm() }
        .onChange(of: diastolicPressure) { _ in validateForm() }
        .onChange(of: pulse) { _ in validateForm() }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Ошибка"),
                message: Text("Некорректные данные"),
                dismissButton: .default(Text("ОК"))
            )
        }
    }
}
// MARK: - UI
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
                
                TextField("120", text: $systolicPressure)
                    .addingTextFieldModifier()
            }
            
            VStack(alignment: .leading) {
                Text("Диастолическое")
                    .smallStyleText()
                
                TextField("90", text: $diastolicPressure)
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
            
            TextField("70", text: $pulse)
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
                
                HStack {
                    DatePicker("", selection: $measurementDate, displayedComponents: .date)
                        .datePickerStyle(CompactDatePickerStyle())
                        .accentColor(.blueColor)
                    Spacer()
                        .padding()
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(14)
            }
            
            VStack(alignment: .leading) {
                Text("Время измерений")
                    .medium16StyleText()
                
                HStack {
                    DatePicker("", selection: $measurementTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(CompactDatePickerStyle())
                        .accentColor(.blueColor)
                    Spacer()
                        .padding()
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color.white)
                .cornerRadius(14)
            }
        }
    }
    
    @ViewBuilder
    func enterNoteTextField() -> some View {
        VStack(alignment: .leading) {
            Text("Заметка")
                .medium16StyleText()
            
            TextField("Опиши свое самочуствие", text: $note)
                .addingTextFieldModifier()
        }
    }
}

// MARK: - Button
private extension BodyParametersView {
    @ViewBuilder
    func savingParametersButton() -> some View {
        VStack {
            Button(action: {
                saveButtonPressed()
            }) {
                Text("Сохранить")
            }
            .safeDataButtonStyle()
            .disabled(!isFormValid)
            .opacity(isFormValid ? 1.0 : 0.3)
        }
    }
    
    func saveButtonPressed() {
        guard let systolic = Int16(systolicPressure),
              let diastolic = Int16(diastolicPressure),
              let pulse = Int16(pulse) else {
            showAlert = true
            return
        }
        
        viewModel.addItem(diastolicPressure: diastolic, systolicPressure: systolic, pulse: pulse, measurementDate: measurementDate, measurementTime: measurementTime, note: note)
    }
    
    func validateForm() {
        isFormValid = !systolicPressure.isEmpty && !diastolicPressure.isEmpty && !pulse.isEmpty
    }
}
