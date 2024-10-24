//
//  TitleBackButtonView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct TitleBackButtonView: View {
    @ObservedObject var coordinator: Coordinator = .shared
    
    var body: some View {
        HStack {
            backButton()
            
            Spacer()
            
            Text("Добавить данные")
                .bigStyleText()
                .padding(.trailing, 32)
            
            Spacer()
        }
        .padding()
    }
}

private extension TitleBackButtonView {
    @ViewBuilder
    func backButton() -> some View {
        Button {
            coordinator.isAddingDataViewPresented = false
        } label: {
            Image(systemName: "chevron.backward")
        }
        .settingButtonStyle()
    }
}
