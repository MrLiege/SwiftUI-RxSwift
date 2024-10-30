//
//  DataButtonView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import SwiftUI

struct DataButtonView: View {
    @ObservedObject var viewModel: MainViewModel
    var date: Date

    var body: some View {
        HStack {
            Spacer()
            VStack(alignment: .leading) {
                Text("Давление")
                    .bigStyleText()
                Text(mYFormattedDate(date))
                    .medium14StyleText(weight: .regular)
            }
            .padding(.leading, 32)
            Spacer()
            settingButton()
        }
        .padding()
    }
}

private extension DataButtonView {
    @ViewBuilder
    func settingButton() -> some View {
        Button {
            viewModel.input.settingButtonTap.onNext(())
        } label: {
            Image(systemName: "plus")
        }
        .settingButtonStyle()
    }
}
