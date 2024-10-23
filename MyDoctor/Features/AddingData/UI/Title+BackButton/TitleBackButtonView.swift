//
//  TitleBackButtonView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct TitleBackButtonView: View {
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
            print("")
        } label: {
            Image(systemName: "chevron.backward")
        }
        .settingButtonStyle()
    }
}
