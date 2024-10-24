//
//  AddingDataView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct AddingDataView: View {
    @StateObject var viewModel = AddingDataViewModel()
    
    var body: some View {
        VStack {
            TitleBackButtonView()
            
            BodyParametersView()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(AddingDataBackgroundView())
    }
}
