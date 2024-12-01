//
//  AddingDataView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import SwiftUI

struct AddingDataView: View {
    @Binding var navPath: NavigationPath
    @StateObject var viewModel: AddingDataViewModel
    
    var body: some View {
        VStack {
            TitleBackButtonView(navPath: $navPath)
            
            BodyParametersView(viewModel: viewModel)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(AddingDataBackgroundView())
        .navigationBarBackButtonHidden(true)
    }
}
